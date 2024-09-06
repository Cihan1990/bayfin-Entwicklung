import 'dart:async';
import 'dart:convert';

import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/line_chart_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/time_based_greeting.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/transaction_list.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/presentation/sales_screen.dart';
import 'package:bayfin/src/features/bank_balance/presentation/view_bankaccount.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final KontoInformation kontoInformation;

  const MainScreen({super.key, required this.kontoInformation});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late DatabaseRepository databaseRepository;
  late KontoInformation kontoInformation;
  List<FlSpot> _daxData = [];

  @override
  void initState() {
    super.initState();
    kontoInformation = widget.kontoInformation;
    databaseRepository = context.read<DatabaseRepository>();
    _fetchDaxData();
  }

  Future<void> _fetchDaxData() async {
    const String apiKey = 'e41c778284ff4b08a957f7614384f3a1';
    const String symbol = 'DAX';
    final url = Uri.parse(
      'https://api.twelvedata.com/time_series?symbol=$symbol&interval=5min&apikey=$apiKey',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final timeSeries = data['values'] as List<dynamic>?;

      if (timeSeries != null) {
        List<FlSpot> tempData = [];
        int index = 0;

        for (var entry in timeSeries) {
          final closePrice =
              double.tryParse(entry['close'] as String? ?? '0') ?? 0;
          tempData.add(FlSpot(index.toDouble(), closePrice));
          index++;
        }

        setState(() {
          _daxData = tempData.reversed.toList();
        });
      } else {
        debugPrint("Fehlende oder ungültige Zeitreihen-Daten");
      }
    } else {
      debugPrint("Fehler beim Abrufen der DAX-Daten: ${response.reasonPhrase}");
    }
  }

  Future<void> aktualisiereKontoInformation(String userId) async {
    final aktualisierteKontoInfo = await databaseRepository.getKontoInfo(
        userId, kontoInformation.documentReference!.id);
    if (aktualisierteKontoInfo != null) {
      setState(() {
        kontoInformation = aktualisierteKontoInfo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthRepository>().getUserId();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ViewBankaccount()),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: context.read<DatabaseRepository>().loadUserData(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Icon(Icons.error);
          } else if (snapshot.hasData) {
            final Benutzer user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Logo and greeting
                  SizedBox(
                    height: screenHeight * 0.1, // 10% of screen height
                    child: LogoWidget(
                        width: screenWidth * 0.6, height: screenHeight * 0.1),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                        width: 96,
                        height: 20,
                        child: TimeBasedGreeting(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 6),
                      SizedBox(
                        height: 40,
                        child: Text(
                          "${user.vorname} ${user.nachname}!",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Card with kontostand and button
                  SizedBox(
                    width: screenWidth * 0.9, // 90% of screen width
                    child: InkWell(
                      onTap: () async {
                        bool shouldUpdate = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SalesScreen(kontoInformation: kontoInformation),
                          ),
                        );
                        if (shouldUpdate) {
                          await aktualisiereKontoInformation(userId);
                        }
                      },
                      child: Card(
                        color: const Color.fromARGB(255, 180, 183, 249),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: StreamBuilder<List<KontoInformation>>(
                            stream: context
                                .read<DatabaseRepository>()
                                .getKontoInformation(userId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState ==
                                      ConnectionState.active) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Text("${kontoInformation.kontostand} €",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    const Spacer(),
                                    const Icon(
                                      Icons.add_box,
                                      size: 24,
                                      color: Colors.black87,
                                    ),
                                  ],
                                );
                              } else {
                                return const Text("No Data");
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Line chart
                  SizedBox(
                    width: screenWidth * 0.9, // 90% of screen width
                    height: screenHeight * 0.3, // 30% of screen height
                    child: const LineChartWidget(),
                  ),
                  const SizedBox(height: 15),
                  // Last transactions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 6),
                      Text(
                        'Letzte Umsätze',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  Expanded(
                    // Make the transaction list fill remaining space
                    child: TransactionListWidget(
                      userId: userId,
                      kontoId: widget.kontoInformation.documentReference!.id,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text('Keine Kontodaten gefunden.');
          }
        },
      ),
    );
  }
}

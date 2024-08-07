import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/transaction_info.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:bayfin/src/features/bank_balance/presentation/sales_screen.dart';
import 'package:bayfin/src/features/bank_balance/presentation/view_bankaccount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  // Attribute

  final KontoInformation kontoInformation;
  // Konstruktor
  const MainScreen({super.key, required this.kontoInformation});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late DatabaseRepository databaseRepository;
  late KontoInformation kontoInformation;

  @override
  void initState() {
    super.initState();
    kontoInformation = widget.kontoInformation;
    databaseRepository = context.read<DatabaseRepository>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> aktualisiereKontoInformation() async {
    final userId = context.read<AuthRepository>().getUserId();
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

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewBankaccount()),
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 24,
              ))),
      body: FutureBuilder(
          future: context.read<DatabaseRepository>().loadUserData(userId),
          builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Icon(Icons.error);
                  } else if (snapshot.hasData) {
                    final Benutzer user = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 0),
                      LogoWidget(width: 217, height: 76),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 96,
                              height: 20,
                              child: Text(
                                'Guten Tag ',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 6),
                          SizedBox(
                            width: 113,
                            height: 40,
                            child: Text(
                              user.vorname,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          width: 361,
                          child: InkWell(
                              onTap: () async {
                                bool shouldUpdate = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SalesScreen(
                                      kontoInformation: kontoInformation,
                                    ),
                                  ),
                                );
                                if (shouldUpdate) {
                                  await aktualisiereKontoInformation();
                                }
                              },
                              child: Card(
                                  color:
                                      const Color.fromARGB(255, 180, 183, 249),
                                  child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(children: [
                                        Text(
                                            "${widget.kontoInformation.kontostand}€")
                                      ]))))),
                      const SizedBox(height: 15),
                      Container(
                        width: 361,
                        height: 226,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/aktienbild.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
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
                      SizedBox(
                        width: 361,
                        child: Center(
                          child: StreamBuilder<List<Umsatz>>(
                            stream: context
                                .read<DatabaseRepository>()
                                .getUmsatz(
                                    userId,
                                    widget.kontoInformation.documentReference!
                                        .id),
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState ==
                                      ConnectionState.active) {
                                List<Umsatz> umsatzliste = snapshot.data!;

                                List<TransactionInfo> transactionliste = [];
                                int i = 0;
                                for (var u in umsatzliste) {
                                  if (i < 3) {
                                    transactionliste.add(TransactionInfo(
                                      firmName: u.umsatzname,
                                      type: u.type,
                                      firmLogoPath:
                                          "assets/images/vodafonelogo.png",
                                      amount: u.betrag,
                                    ));
                                    i++;
                                  }
                                }
                                // FALL: Future ist komplett und hat Daten!
                                return Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 180, 183, 249),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      width: 361,
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const SizedBox(height: 15),
                                          ...transactionliste
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              } else if (snapshot.connectionState !=
                                  ConnectionState.waiting) {
                                // FALL: Sind noch im Ladezustand
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                // FALL: Es gab nen Fehler
                                return const Icon(Icons.error);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
                   else {
                    return const Text('Keine Kontodaten gefunden.');
                  }

                }
            ),
    );
  }
}

import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/transaction_info.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:bayfin/src/features/bank_balance/presentation/sales_screen.dart';
import 'package:bayfin/src/features/bank_balance/presentation/view_bankaccount.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final int kontoIndex;
  // Konstruktor
  const MainScreen(
      {super.key, required this.databaseRepository, required this.kontoIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late DatabaseRepository databaseRepository;

  @override
  void initState() {
    super.initState();
    databaseRepository = widget.databaseRepository;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewBankaccount(
                            databaseRepository: widget.databaseRepository,
                          )),
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 24,
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 0),
                LogoWidget(width: 217, height: 76),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                        'Cihan!',
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SalesScreen(
                                        databaseRepository:
                                            widget.databaseRepository,
                                        kontoIndex: widget.kontoIndex,
                                      )));
                        },
                        child: Card(
                            color: const Color.fromARGB(255, 180, 183, 249),
                            child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(children: [
                                  FutureBuilder(
                                    future: databaseRepository.getBenutzer("1"),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.connectionState ==
                                              ConnectionState.done) {
                                        // FALL: Future ist komplett und hat Daten!
                                        return Text(
                                            "${snapshot.data!.bank[widget.kontoIndex].kontostand}€");
                                      } else if (snapshot.connectionState !=
                                          ConnectionState.done) {
                                        // FALL: Sind noch im Ladezustand
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else {
                                        // FALL: Es gab nen Fehler
                                        return const Icon(Icons.error);
                                      }
                                    },
                                  ),
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
                SizedBox(
                  width: 361,
                  child: Center(
                    child: FutureBuilder(
                      future: widget.databaseRepository.getBenutzer("1"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done) {
                          Benutzer user = snapshot.data!;
                          List<Umsatz> umsatzliste = user.umsatze;
                          List<TransactionInfo> transactionliste = [];
                          for (var u in umsatzliste) {
                            transactionliste.add(TransactionInfo(
                              firmName: u.umsatzname,
                              firmLogoPath: "assets/images/vodafonelogo.png",
                              amount: u.betrag,
                            ));
                          }
                          // FALL: Future ist komplett und hat Daten!
                          return Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                color: const Color.fromARGB(255, 180, 183, 249),
                                width: 361,
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    //     Padding(
                                    // padding: const EdgeInsets.all(12.0),
                                    Text(
                                      'Letzte Umsätze',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    const SizedBox(height: 15),
                                    ...transactionliste
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.connectionState !=
                            ConnectionState.done) {
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
      ),
    );
  }
}

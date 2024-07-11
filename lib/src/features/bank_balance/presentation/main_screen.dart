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
  const MainScreen({
    super.key,
    required this.kontoInformation,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late DatabaseRepository databaseRepository;

  @override
  void initState() {
    super.initState();
    databaseRepository = context.read<DatabaseRepository>();
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
                      builder: (context) => ViewBankaccount(
                            
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
                                        
                                        kontoInformation:
                                            widget.kontoInformation,
                                      )));
                        },
                        child: Card(
                            color: const Color.fromARGB(255, 180, 183, 249),
                            child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(children: [
                                  Text("${widget.kontoInformation.kontostand}€")
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
                    child: FutureBuilder(
                      future: context.read<DatabaseRepository>().getBenutzer(userId),
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
                          return StreamBuilder<Object>(
                              stream: context.read<DatabaseRepository>()
                                  .getUmsatz(userId, '2UzevWBXk744LAO1W1aI'),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.connectionState ==
                                        ConnectionState.done) {
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
                                    ConnectionState.done) {
                                  // FALL: Sind noch im Ladezustand
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  // FALL: Es gab nen Fehler
                                  return const Icon(Icons.error);
                                }
                              });
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

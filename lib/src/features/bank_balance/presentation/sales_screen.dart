import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/add_umsatz.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/transaction_info.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalesScreen extends StatefulWidget {
  // Attribute

  final KontoInformation kontoInformation;
  // Konstruktor
  const SalesScreen({super.key, required this.kontoInformation});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController umzatzbezeichnungController;
  late TextEditingController umsatzsummeController;

  @override
  void initState() {
    super.initState();
    umzatzbezeichnungController = TextEditingController();
    umsatzsummeController = TextEditingController();
  }

  @override
  void dispose() {
    umsatzsummeController.dispose();
    umzatzbezeichnungController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthRepository>().getUserId();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 24,
                )),
            IconButton(
                onPressed: () async {
                  await showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            content: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Positioned(
                                  right: -40,
                                  top: -40,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      child: const Icon(Icons.close),
                                    ),
                                  ),
                                ),
                                AddUmsatz(
                                    kontoInformation: widget.kontoInformation)
                              ],
                            ),
                          ));
                },
                icon: const Icon(
                  Icons.queue,
                  size: 24,
                )),
          ],
        ),
        leadingWidth: 200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 10),
                LogoWidget(width: 217, height: 76),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                  ],
                ),
                Card(
                  color: const Color.fromARGB(255, 180, 183, 249),
                  child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: StreamBuilder(
                              stream: context
                                  .read<DatabaseRepository>()
                                  .getKontoInformation(userId),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.connectionState ==
                                        ConnectionState.active) {
                                  return Center(
                                    child: Text(
                                        "${widget.kontoInformation.kontostand} €"),
                                  );
                                } else {
                                  return const Text("No Data");
                                }
                              }))),
                ),
                SizedBox(
                  width: 370,
                  child: Center(
                    child: StreamBuilder<List<Umsatz>>(
                      stream: context.read<DatabaseRepository>().getUmsatz(
                          userId,
                          widget.kontoInformation.documentReference!.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState ==
                                ConnectionState.active) {
                          List<Umsatz> umsatzliste = snapshot.data!;

                          List<TransactionInfo> transactionliste = [];
                          for (var u in umsatzliste) {
                            transactionliste.add(TransactionInfo(
                              firmName: u.umsatzname,
                              type: u.type,
                              amount: u.betrag,
                            ));
                          }
                          // FALL: Future ist komplett und hat Daten!
                          return Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Card(
                                color: const Color.fromARGB(255, 180, 183, 249),
                                // width: 361,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Umsätze',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      const SizedBox(height: 15),
                                      ...transactionliste
                                    ],
                                  ),
                                ),
                              )
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

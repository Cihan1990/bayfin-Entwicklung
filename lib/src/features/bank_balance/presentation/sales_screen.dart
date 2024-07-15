import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/registrations_text.dart';
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
                  Navigator.pop(context,true);
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
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: RegistrationsText(
                                            controller:
                                                umzatzbezeichnungController,
                                            validator: validateUmsatzbz,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            text: 'Umsatzbezeichnung',
                                            color: Colors.black,
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: RegistrationsText(
                                              controller: umsatzsummeController,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: validateUmsatzsumme,
                                              text: 'Umsatzsumme',
                                              color: Colors.black)),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: ElevatedButton(
                                          child:
                                              const Text('Umsatz hinzufügen'),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              final userId = context
                                                  .read<AuthRepository>()
                                                  .getCurrentUser()!
                                                  .uid;

                                              await context
                                                  .read<DatabaseRepository>()
                                                  .addUmsatz(
                                                      Umsatz(
                                                          betrag: double.parse(
                                                              umsatzsummeController
                                                                  .text),
                                                          umsatzname:
                                                              umzatzbezeichnungController
                                                                  .text,
                                                          type: checkIfUmsatzIsMinus(
                                                              umsatzsummeController
                                                                  .text)),
                                                      userId,
                                                      widget
                                                          .kontoInformation
                                                          .documentReference!
                                                          .id);

                                              setState(() {
                                                final updatedInfo =
                                                    widget.kontoInformation;
                                                updatedInfo
                                                    .kontostand = updatedInfo
                                                        .kontostand! +
                                                    double.parse(
                                                        umsatzsummeController
                                                            .text);
                                                if (context.mounted) {
                                                  Navigator.of(context).pop();
                                                }
                                                context
                                                    .read<DatabaseRepository>()
                                                    .updateKonto(
                                                        updatedInfo, userId);
                                              });
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
                          child: Column(children: [
                            Text("${widget.kontoInformation.kontostand}€")
                          ])),
                    )),
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

  String? validateUmsatzbz(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte Umsatzbezeichnung eingeben';
    }
    return null;
  }

  String? validateUmsatzsumme(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte Umsatzsumme eingeben';
    }
    return null;
  }

  bool checkIfUmsatzIsMinus(String umsatz) {
    // Überprüfen, ob der String ein Minuszeichen enthält
    if (umsatz.contains('-')) {
      return false;
    } else {
      return true;
    }
  }
}

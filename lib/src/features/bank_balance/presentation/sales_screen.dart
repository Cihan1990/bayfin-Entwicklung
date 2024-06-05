import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/registrations_text.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/transaction_info.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:flutter/material.dart';

class SalesScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final int kontoIndex;
  // Konstruktor
  const SalesScreen(
      {super.key, required this.databaseRepository, required this.kontoIndex});

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
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
                                              await widget.databaseRepository
                                                  .addUmsatz(
                                                      Umsatz(
                                                          betrag: double.parse(
                                                              umsatzsummeController
                                                                  .text),
                                                          umsatzname:
                                                              umzatzbezeichnungController
                                                                  .text),
                                                      "1");
                                              setState(() {});
                                              if (context.mounted) {
                                                Navigator.of(context).pop();
                                              }

                                              // _formKey.currentState!.save();
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
                              Text(
                                  "${user.bank[widget.kontoIndex].kontostand}€"),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 361,
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      'Umsätze',
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
}

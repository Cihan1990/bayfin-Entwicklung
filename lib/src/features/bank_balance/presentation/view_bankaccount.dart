// ignore_for_file: use_build_context_synchronously

import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/registrations_text.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/presentation/main_screen.dart';
import 'package:flutter/material.dart';

class ViewBankaccount extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  // Konstruktor
  const ViewBankaccount({super.key, required this.databaseRepository});

  // Methoden
  @override
  State<ViewBankaccount> createState() => _ViewBankaccountState();
}

class _ViewBankaccountState extends State<ViewBankaccount> {
  final _formKey = GlobalKey<FormState>();
  late Future<Benutzer?> loggedInUser;
  late TextEditingController bankController;
  late TextEditingController ibanController;

  @override
  void initState() {
    super.initState();
    loggedInUser = widget.databaseRepository.getBenutzer("1");
    bankController = TextEditingController();
    ibanController = TextEditingController();
  }

  @override
  void dispose() {
    bankController.dispose();
    ibanController.dispose();

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
                  onPressed: () async {
                    await showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
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
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: bankController,
                                            text: 'Bank',
                                            validator: validateBk,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: RegistrationsText(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: ibanController,
                                            text: 'IBAN',
                                            validator: validateIban,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: ElevatedButton(
                                            child: const Text(
                                                'Bankkonto hinzufügen'),
                                            onPressed: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                await widget.databaseRepository
                                                    .addKonto(
                                                        KontoInformation(
                                                            bank: bankController
                                                                .text,
                                                            iban: ibanController
                                                                .text),
                                                        "1");
                                                setState(() {});
                                                Navigator.of(context).pop();

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
                    Icons.add_card,
                    size: 24,
                  )),
            ],
          ),
          leadingWidth: 200,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen(
                              databaseRepository: widget.databaseRepository,
                            )),
                  );
                },
                icon: const Icon(
                  Icons.logout,
                  size: 24,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                    child: Column(children: [
                  const SizedBox(height: 10),
                  LogoWidget(width: 217, height: 76),
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      height: 30,
                      child: Text(
                        'Übersicht ',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: Text(
                          'Girokonto',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  FutureBuilder(
                    future: loggedInUser,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        // FALL: Future ist komplett und hat Daten!
                        return Column(
                            children: _getBayFinButtons(snapshot.data!.bank));
                      } else if (snapshot.connectionState !=
                          ConnectionState.done) {
                        // FALL: Sind noch im Ladezustand
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        // FALL: Es gab nen Fehler
                        return const Icon(Icons.error);
                      }
                    },
                  ),
                ])))));
  }

  List<Widget> _getBayFinButtons(List<KontoInformation> kontoInfos) {
    List<Widget> buttonList = [];
    for (KontoInformation info in kontoInfos) {
      buttonList.add(SizedBox(
        width: 361,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainScreen(
                          databaseRepository: widget.databaseRepository,
                          kontoIndex: kontoInfos.indexOf(info),
                        )));
          },
          child: Card(
            color: const Color.fromARGB(255, 180, 183, 249),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    "Girokonto",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    info.iban,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ));
      buttonList.add(
        const SizedBox(height: 15),
      );
    }

    return buttonList;
  }

  String? validateIban(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte IBAN eingeben';
    }
    return null;
  }

  String? validateBk(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte Konto eingeben';
    }
    return null;
  }
}

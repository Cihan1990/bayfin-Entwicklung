import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/presentation/main_screen.dart';
import 'package:flutter/material.dart';

class ViewBankaccount extends StatefulWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const ViewBankaccount({
    super.key,
    required this.databaseRepository,
    required this.authRepository,
  });

  @override
  State<ViewBankaccount> createState() => _ViewBankaccountState();
}

class _ViewBankaccountState extends State<ViewBankaccount> {
  final _formKey = GlobalKey<FormState>();
  late Stream<List<KontoInformation>> konten;
  late TextEditingController bankController;
  late TextEditingController ibanController;
  late TextEditingController ksController;
  // late TextEditingController idController;

  @override
  void initState() {
    super.initState();
    konten = widget.databaseRepository.getKontoInformation();
    bankController = TextEditingController();
    ibanController = TextEditingController();
    ksController = TextEditingController();

    // idController = TextEditingController();
  }

  @override
  void dispose() {
    bankController.dispose();
    ibanController.dispose();
    ksController.dispose();
    // idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
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
                              child: TextFormField(
                                controller: bankController,
                                decoration:
                                    const InputDecoration(labelText: 'Bank'),
                                validator: validateBk,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                controller: ibanController,
                                decoration:
                                    const InputDecoration(labelText: 'IBAN'),
                                validator: validateIban,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                controller: ksController,
                                decoration: const InputDecoration(
                                    labelText: 'Kontostand'),
                                keyboardType: TextInputType.number,
                                validator: validateKS,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                child: const Text('Bankkonto hinzufügen'),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    double? kontostand;
                                    if (ksController.text.isNotEmpty) {
                                      kontostand =
                                          double.tryParse(ksController.text);
                                    }
                                    await widget.databaseRepository.addKonto(
                                      KontoInformation(
                                        bank: bankController.text,
                                        iban: ibanController.text,
                                        kontostand: kontostand,
                                      ),
                                      widget.authRepository.getUserId(),
                                    );

                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.add_card,
              size: 24,
            ),
          )
        ]),
        leadingWidth: 200,
        actions: [
          IconButton(
            onPressed: () {
              widget.authRepository.logout();
            },
            icon: const Icon(
              Icons.logout,
              size: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 10),
              LogoWidget(width: 217, height: 76),
              const SizedBox(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 200,
                    height: 30,
                    child: Text(
                      'Übersicht ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
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
              StreamBuilder<List<KontoInformation>>(
                stream: konten,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Icon(Icons.error);
                  } else if (snapshot.hasData) {
                    return Column(
                      children: _getBayFinButtons(snapshot.data!),
                    );
                  } else {
                    return const Text('Keine Kontoinformationen gefunden.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
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
                  authRepository: widget.authRepository,
                  kontoIndex: kontoInfos.indexOf(info),
                ),
              ),
            );
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
      buttonList.add(const SizedBox(height: 15));
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
      return 'Bitte Bank eingeben';
    }
    return null;
  }

  String? validateKS(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte Kontostand eingeben';
    }
    double? kontostand = double.tryParse(input);
    if (kontostand == null) {
      return 'Kontostand muss eine Zahl sein';
    }
    return null;
  }
}

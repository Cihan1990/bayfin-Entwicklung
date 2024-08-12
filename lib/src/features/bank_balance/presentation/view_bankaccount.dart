import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/application/validators.dart';
import 'package:bayfin/src/features/authentication/presentation/account_edit.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewBankaccount extends StatefulWidget {
  const ViewBankaccount({super.key});

  @override
  State<ViewBankaccount> createState() => _ViewBankaccountState();
}

class _ViewBankaccountState extends State<ViewBankaccount> {
  final _formKey = GlobalKey<FormState>();

  late Stream<List<KontoInformation>> konten;
  late TextEditingController bankController;
  late TextEditingController ibanController;
  late TextEditingController ksController;

  @override
  void initState() {
    super.initState();

    konten = context
        .read<DatabaseRepository>()
        .getKontoInformation(context.read<AuthRepository>().getUserId());
    bankController = TextEditingController();
    ibanController = TextEditingController();
    ksController = TextEditingController();
  }

  @override
  void dispose() {
    bankController.dispose();
    ibanController.dispose();
    ksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                                    await context
                                        .read<DatabaseRepository>()
                                        .addKonto(
                                          KontoInformation(
                                            bank: bankController.text,
                                            iban: ibanController.text,
                                            kontostand: kontostand,
                                          ),
                                          context
                                              .read<AuthRepository>()
                                              .getUserId(),
                                        );
                                    bankController.clear();
                                    ibanController.clear();
                                    ksController.clear();
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
          ),
          IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountEditScreen(),
                    ),
                  )),
        ]),
        leadingWidth: 200,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthRepository>().logout();
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
      buttonList.add(
        Dismissible(
          key: Key(info.iban), // Each item must have a unique key
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) async {
            await context.read<DatabaseRepository>().deleteKonto(
                info.iban, context.read<AuthRepository>().getUserId());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Konto ${info.bank} gelöscht')),
            );
          },
          child: SizedBox(
            width: 361,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(kontoInformation: info),
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
          ),
        ),
      );
      buttonList.add(const SizedBox(height: 15));
    }
    return buttonList;
  }

 
}

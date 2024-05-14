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
  @override
  Widget build(BuildContext context) {
    Benutzer loggedInUser = widget.databaseRepository.getBenutzer("1")!;

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
                              backgroundColor: const Color(0xffE6E9FF),
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
                                      child: const CircleAvatar(
                                        backgroundColor: Color(0xffE6E9FF),
                                        child: Icon(Icons.close),
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
                                            text: 'Kontoart',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: RegistrationsText(
                                            text: 'IBAN',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: ElevatedButton(
                                            child: const Text(
                                                'Bankkonto hinzufügen'),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.of(context).pop();

                                                _formKey.currentState!.save();
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
                  Navigator.pushReplacement(
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
                  ..._getBayFinButtons(loggedInUser.bank)
                ])))));
  }

  List<Widget> _getBayFinButtons(List<KontoInformation> kontoInfos) {
    List<Widget> buttonList = [];
    for (KontoInformation info in kontoInfos) {
      buttonList.add(SizedBox(
        width: 361,
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainScreen(
                        databaseRepository: widget.databaseRepository)));
          },
          child: Card(
            color: const Color(0xFFD6D7FA),
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
}

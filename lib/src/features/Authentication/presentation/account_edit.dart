import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/pronouns.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/registrations_text.dart';
import 'package:bayfin/src/features/bank_balance/presentation/view_bankaccount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountEditScreen extends StatefulWidget {
  // Attribute

  // Konstruktor
  const AccountEditScreen({super.key});

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  late TextEditingController vornameController;
  late TextEditingController nachnameController;
  late TextEditingController geburtsdatumController;
  late TextEditingController mailController;
  late TextEditingController pronounsController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    vornameController = TextEditingController();
    nachnameController = TextEditingController();
    geburtsdatumController = TextEditingController();
    mailController = TextEditingController();
    pronounsController = TextEditingController();
    _loadUserData();
  }

  @override
  void dispose() {
    vornameController.dispose();
    nachnameController.dispose();
    geburtsdatumController.dispose();
    mailController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    final userId = context.read<AuthRepository>().getUserId();
    final benutzer =
        await context.read<DatabaseRepository>().getBenutzer(userId);
    if (benutzer != null) {
      setState(() {
        vornameController.text = benutzer.benutzername.vorname;
        nachnameController.text = benutzer.benutzername.nachname;
        mailController.text = benutzer.email;
        geburtsdatumController.text = benutzer.geburtsdatum ?? '';
        pronounsController.text = benutzer.anrede ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 55),
                LogoWidget(width: 217, height: 76),
                const SizedBox(height: 10),
                const Text('Perönliche Daten',
                    style: TextStyle(
                        shadows: [
                          Shadow(color: Colors.white, offset: Offset(0, -5))
                        ],
                        color: Colors.transparent,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFFFFFFF),
                        decorationThickness: 1.35)),
                const SizedBox(height: 25),
                Prounouns(
                  text: '  Anrede',
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 15),
                RegistrationsText(
                  controller: vornameController,
                  text: '  Vorname',
                  validator: validateVn,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 10),
                RegistrationsText(
                  controller: nachnameController,
                  text: '  Nachname',
                  validator: validateNn,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 10),
                RegistrationsText(
                  controller: geburtsdatumController,
                  text: '  Geburtsdatum',
                  hinttext: 'TT.MM.JJJJ',
                  validator: validateGb,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 10),
                RegistrationsText(
                  controller: mailController,
                  validator: validateEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  text: '  E-Mail Adresse',
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 110),
                ElevatedButton(
                  child: const Text('Änderungen übernehmen'),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const LoginScreen(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ViewBankaccount(),
                                ));
                          },
                          child: const Text("Zurück zur Kontoübersicht",
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -5))
                                ],
                                color: Colors.transparent,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFFFFFFF),
                                decorationThickness: 1.35,
                              ))),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateVn(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte Vorname eingeben';
    }
    return null;
  }

  String? validateNn(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte Nachname eingeben';
    }
    return null;
  }

  String? validateGb(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte Geburtsdatum eingeben';
    }
    return null;
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte E-Mail eingeben';
    }
    return null;
  }
}

// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/passwort_add_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/pronouns.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/registrations_text.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  // Konstruktor
  const RegistrationScreen({super.key, required this.databaseRepository});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late TextEditingController vornameController;
  late TextEditingController nachnameController;
  late TextEditingController geburtsdatumController;
  late TextEditingController mailController;
  @override
  void initState() {
    super.initState();
    vornameController = TextEditingController();
    nachnameController = TextEditingController();
    geburtsdatumController = TextEditingController();
    mailController = TextEditingController();
  }

  @override
  void dispose() {
    vornameController.dispose();
    nachnameController.dispose();
    geburtsdatumController.dispose();
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
              child: Column(children: [
            const SizedBox(height: 55),
            LogoWidget(width: 217, height: 76),
            SizedBox(height: 10),
            Text('Registrieren',
                style: TextStyle(
                    shadows: const [
                      Shadow(color: Colors.white, offset: Offset(0, -5))
                    ],
                    color: Colors.transparent,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFFFFFFF),
                    decorationThickness: 1.35)),
            const SizedBox(height: 25),
            Prounouns(text: 'Anrede'),
            SizedBox(height: 5),
            const SizedBox(height: 15),
            RegistrationsText(
              controller: vornameController,
              text: 'Vorname',
              validator: validateVn,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 5),
            const SizedBox(height: 10),
            RegistrationsText(
              controller: nachnameController,
              text: 'Nachname',
              validator: validateNn,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 5),
            const SizedBox(height: 10),
            RegistrationsText(
              controller: geburtsdatumController,
              text: 'Geburtsdatum',
              hinttext: 'TT.MM.JJJJ',
              validator: validateGb,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 5),
            SizedBox(height: 10),
            RegistrationsText(
              controller: mailController,
              validator: validateEmail,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              text: 'E-Mail Adresse',
            ),
            SizedBox(height: 5),
            const SizedBox(height: 110),
            ElevatedButton(
              child: Text('Passwort erstellen'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswortAddScreen(
                      databaseRepository: widget.databaseRepository,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(
                            databaseRepository: widget.databaseRepository,
                          ),
                        ));
                  },
                  child: Text("Zurück zur Anmeldung",
                      style: TextStyle(
                        shadows: const [
                          Shadow(color: Colors.white, offset: Offset(0, -5))
                        ],
                        color: Colors.transparent,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color(0xFFFFFFFF),
                        decorationThickness: 1.35,
                      ))),
            ]),
          ])),
        )));
  }
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
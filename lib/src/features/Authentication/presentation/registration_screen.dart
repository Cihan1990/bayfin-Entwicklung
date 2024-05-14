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
              text: 'Vorname',
              
            ),
            SizedBox(height: 5),
            const SizedBox(height: 10),
            RegistrationsText(
              text: 'Nachname',
            ),
            SizedBox(height: 5),
            const SizedBox(height: 10),
            RegistrationsText(
              text: 'Geburtsdatum',
              hinttext: 'TT.MM.JJJJ',
            ),
            SizedBox(height: 5),
            SizedBox(height: 10),
            RegistrationsText(
              text: 'E-Mail Adresse',
            ),
            SizedBox(height: 5),
            const SizedBox(height: 90),
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

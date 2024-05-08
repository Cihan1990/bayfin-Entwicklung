// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:bayfin/src/features/Authentication/presentation/Passwort_add_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/bay_fin_button.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/pronouns.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/registrations_text.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 393,
        height: 852,
        decoration: const BoxDecoration(color: Color(0xFF212C95)),
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
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SF Regular',
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFFFFFFF),
                        decorationThickness: 1.35)),
                const SizedBox(height: 25),
                Prounouns(text: 'Anrede'),
                SizedBox(height: 5),
                const SizedBox(height: 15),
                RegistrationsText(text: 'Vorname'),
                SizedBox(height: 5),
                const SizedBox(height: 10),
                RegistrationsText(text: 'Nachname'),
                SizedBox(height: 5),
                const SizedBox(height: 10),
                RegistrationsText(
                  text: 'Geburtsdatum',
                  hinttext: 'TT.MM.JJJJ',
                  hintstyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0x72010000).withOpacity(0.45),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(height: 10),
                RegistrationsText(text: 'E-Mail Adresse'),
                SizedBox(height: 5),
                const SizedBox(height: 90),
                BayFinButton(
                  navigationWidget: PasswortAddScreen(),
                  text: "Passwort erstellen",
                  width: 247,
                  height: 50,
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
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: Text("Zurück zur Anmeldung",
                              style: TextStyle(
                                shadows: const [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -5))
                                ],
                                color: Colors.transparent,
                                fontSize: 15,
                                fontFamily: "SF Pro",
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: const Color(0xFFFFFFFF),
                                decorationThickness: 1.35,
                              ))),
                    ])
              ]),
            )),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:bayfin/src/features/Authentication/presentation/Passwort_add_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/bay_fin_button.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/logo_widget.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  List<String> genders = ["", "Herr", "Frau", "Divers"];
  late String selectedGenders = genders.first;

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
                const SizedBox(height: 35),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Anrede',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFFFFFFF),
                      decorationThickness: 1.35,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 45,
                          width: 110,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                              color: Color(0xFFD3D3D3),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  dropdownColor: Color(
                                      0xFFD3D3D3), // here you change the background color

                                  value: selectedGenders,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  isExpanded: true,
                                  style: TextStyle(
                                      color:
                                          Color(0x72010000).withOpacity(0.45),
                                      fontSize: 17.0),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedGenders = newValue!;
                                    });
                                  },
                                  items: genders.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList())))
                    ]),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Vorname',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFFFFFFF),
                      decorationThickness: 1.35,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                    decoration: InputDecoration(
                  fillColor: const Color(0xFFD3D3D3),
                  contentPadding:
                      const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  filled: true,
                )),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nachname',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFFFFFFF),
                      decorationThickness: 1.35,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                    decoration: InputDecoration(
                  fillColor: const Color(0xFFD3D3D3),
                  contentPadding:
                      const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  filled: true,
                )),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Geburtsdatum',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFFFFFFF),
                      decorationThickness: 1.35,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                    decoration: InputDecoration(
                        fillColor: const Color(0xFFD3D3D3),
                        contentPadding: const EdgeInsets.only(
                            top: 0.0, left: 10, right: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        filled: true,
                        hintText: "TT.MM.JJJJ",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0x72010000).withOpacity(0.45),
                        ))),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'E-Mail Adresse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFFFFFFF),
                      decorationThickness: 1.35,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                    decoration: InputDecoration(
                  fillColor: const Color(0xFFD3D3D3),
                  contentPadding:
                      const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  filled: true,
                )),
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

import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/Authentication/presentation/account_exist.dart';
import 'package:bayfin/src/features/Authentication/presentation/registration_screen.dart';
import 'package:flutter/material.dart';

class PasswortAddScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  // Konstruktor
  const PasswortAddScreen({super.key, required this.databaseRepository});

  @override
  State<PasswortAddScreen> createState() => _PasswortAddScreenState();
}

class _PasswortAddScreenState extends State<PasswortAddScreen> {
  bool showPassword = false;
  bool showPasswordRepeated = false;

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
                  Container(
                    width: 217,
                    height: 76,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bayfinlogo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Passwort',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    validator: validatePw,
                    obscureText: !showPassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: showPassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      contentPadding:
                          const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.0)),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Passwort wiederholen',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    obscureText: !showPasswordRepeated,
                    enableSuggestions: false,
                    validator: validatePwrp,
                    autocorrect: false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPasswordRepeated = !showPasswordRepeated;
                          });
                        },
                        icon: showPasswordRepeated
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      contentPadding:
                          const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.0)),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 350),
                  ElevatedButton(
                    child: const Text('Benutzerkonto erstellen'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountExistScreen(
                            databaseRepository: widget.databaseRepository,
                          ),
                        ),
                      );
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
                                    builder: (context) => RegistrationScreen(
                                      databaseRepository:
                                          widget.databaseRepository,
                                    ),
                                  ));
                            },
                            child: const Text("Zurück zur Registrierung",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: Colors.white,
                                        offset: Offset(0, -5))
                                  ],
                                  color: Colors.transparent,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  decorationThickness: 1.35,
                                )))
                      ])
                ]),
              )),
        ));
  }
}

String? validatePw(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte Passwort eingeben';
  }
  return null;
}

String? validatePwrp(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte Passwort wiederholen';
  }
  return null;
}

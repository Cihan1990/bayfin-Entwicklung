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

  final TextEditingController _passwordField1 = TextEditingController();
  final TextEditingController _passwordField2 = TextEditingController();

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
                      '  Passwort',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    validator: validatePw,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: !showPassword,
                    enableSuggestions: false,
                    controller: _passwordField1,
                    autocorrect: false,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.grey.shade400),
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
                      '  Passwort wiederholen',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    obscureText: !showPasswordRepeated,
                    enableSuggestions: false,
                    validator: validatePw,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordField2,
                    autocorrect: false,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.grey.shade400),
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

  String? validatePw(String? input) {
    if (_passwordField1.text != _passwordField2.text) {
      return "Passwörter stimmen nicht überein";
    }
    if (input == null || input.isEmpty) {
      return "Bitte Passwort eingeben";
    }
    if (input.length < 6 || input.length > 12) {
      return "Passwort muss zwischen 6 und maximal 12 Zeichen lang sein";
    }
    return null;
  }
}

import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/passwort_return_accept_screen.dart';
import 'package:flutter/material.dart';

class PasswortReturnScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  // Konstruktor
  const PasswortReturnScreen({super.key, required this.databaseRepository});

  @override
  State<PasswortReturnScreen> createState() => _PasswortReturnScreenState();
}

class _PasswortReturnScreenState extends State<PasswortReturnScreen> {
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
                    child: const Text('Benutzername/E-Mail Adresse',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    validator: validateName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.grey.shade400),
                      contentPadding:
                          const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Neues Passwort',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    obscureText: !showPassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: _passwordField1,
                    validator: validatePw,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Neues Passwort wiederholen',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    obscureText: !showPasswordRepeated,
                    enableSuggestions: false,
                    controller: _passwordField2,
                    validator: validatePw,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 275),
                  ElevatedButton(
                    child: const Text('Passwort zurücksetzen'),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PasswortReturnAcceptScreen(
                                    databaseRepository:
                                        widget.databaseRepository,
                                  )));
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
                                    builder: (context) => LoginScreen(
                                      databaseRepository:
                                          widget.databaseRepository,
                                    ),
                                  ));
                            },
                            child: const Text("Zurück zum Login",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: Colors.white,
                                        offset: Offset(0, -5))
                                  ],
                                  color: Colors.transparent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFFFFFFFF),
                                  decorationThickness: 1.35,
                                ))),
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

  String? validateName(String? input) {
    if (input == null || input.isEmpty) {
      return "Bitte Buntzername/E-Mail Adresse eingeben";
    }
    if (!input.contains("@")) {
      return 'Email muss das Zeichen "@" enthalten';
    }
    if (!(input.endsWith(".com") || input.endsWith(".de"))) {
      return 'Email muss mit ".com" oder ".de" enden';
    }
    return null;
  }
}

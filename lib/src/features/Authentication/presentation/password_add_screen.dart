import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/Authentication/presentation/registration_screen.dart';
import 'package:bayfin/src/features/authentication/application/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswortAddScreen extends StatefulWidget {
  // Attribute

  final String email;
  final String vorname;
  final String nachname;
  final String geburtsdatum;
  final String pronouns;
  // Konstruktor
  const PasswortAddScreen(
      {super.key,
      required this.email,
      required this.vorname,
      required this.nachname,
      required this.geburtsdatum,
      required this.pronouns});

  @override
  State<PasswortAddScreen> createState() => _PasswortAddScreenState();
}

class _PasswortAddScreenState extends State<PasswortAddScreen> {
  bool showPassword = false;
  bool showPasswordRepeated = false;

  final TextEditingController _passwordField1 = TextEditingController();
  final TextEditingController _passwordField2 = TextEditingController();
  late TextEditingController vornameController;
  late TextEditingController nachnameController;
  late TextEditingController geburtsdatumController;
  late TextEditingController mailController;
  late TextEditingController pronounsController;

  @override
  void initState() {
    super.initState();
    vornameController = TextEditingController();
    nachnameController = TextEditingController();
    geburtsdatumController = TextEditingController();
    mailController = TextEditingController();
    pronounsController = TextEditingController();
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
    final provider = Provider.of<DatabaseRepository>(context);
    final authProvider = Provider.of<AuthRepository>(context);

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
                    onPressed: () async {
                      // User bei Firebase Authentication registrieren
                      await context
                          .read<AuthRepository>()
                          .signUpWithEmailAndPassword(
                              widget.email, _passwordField1.text);
                      await provider.submitRegistrationData(
                          widget.pronouns,
                          widget.vorname,
                          widget.nachname,
                          widget.geburtsdatum,
                          widget.email,
                          authProvider.getUserId());
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
                                    builder: (context) =>
                                        const RegistrationScreen(),
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

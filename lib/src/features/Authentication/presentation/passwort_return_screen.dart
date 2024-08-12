import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/features/authentication/application/validators.dart';
import 'package:bayfin/src/features/authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/passwort_return_accept_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswortReturnScreen extends StatefulWidget {
  // Attribute

  // Konstruktor
  const PasswortReturnScreen({super.key});

  @override
  State<PasswortReturnScreen> createState() => _PasswortReturnScreenState();
}

class _PasswortReturnScreenState extends State<PasswortReturnScreen> {
  bool showPassword = false;
  bool showPasswordRepeated = false;
  final TextEditingController _passwordField1 = TextEditingController();
  final TextEditingController _passwordField2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController mailController;

  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
  }

  @override
  void dispose() {
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
                key: _formKey,
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
                  const SizedBox(height: 185),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('  Benutzername/E-Mail Adresse',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    validator: validateName,
                    controller: mailController,
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
                  const SizedBox(height: 65),
                  ElevatedButton(
                    child: const Text('Passwort zurücksetzen'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await context
                            .read<AuthRepository>()
                            .resetPassword(mailController.text);
                        if (mounted) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PasswortReturnAcceptScreen()));
                        }
                      } else {
                        print("showError");
                      }
                    },
                  ),
                  const SizedBox(height: 265),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
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
}

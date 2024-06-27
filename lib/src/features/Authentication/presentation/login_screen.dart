// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/passwort_return_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/registration_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/social_login_button.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/text_field_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  final AuthRepository authRepository;

  // Konstruktor
  const LoginScreen(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});
  // Konstruktor

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController mailController;
  late TextEditingController _pwController;

  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    _pwController = TextEditingController();
  }

  @override
  void dispose() {
    mailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(children: [
              const SizedBox(height: 75),
              LogoWidget(width: 385, height: 136),
              const SizedBox(height: 60),
              TextFieldAuth(
                mailController: mailController,
                pwController: _pwController,
              ),
              const SizedBox(height: 0),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswortReturnScreen(
                            databaseRepository: widget.databaseRepository,
                            authRepository: widget.authRepository,
                          ),
                        ));
                  },
                  child: Text(
                    "Passwort vergessen",
                    style: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                )
              ]),
              const SizedBox(height: 28),
              ElevatedButton(
                child: Text('Login'),
                onPressed: () async {
                  print(mailController.text);
                  print(_pwController.text);
                  await widget.authRepository.loginWithEmailAndPassword(
                      mailController.text, _pwController.text);
                },
              ),
              const SizedBox(height: 42),
              Row(children: <Widget>[
                Expanded(child: Divider(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Oder",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(child: Divider(color: Colors.white)),
              ]),
              SizedBox(height: 40),
              SocialLoginButton(
                icon: Icon(
                  Icons.apple,
                  color: Colors.black,
                  size: 30,
                ),
                text: "Sign in with Apple",
              ),
              SizedBox(
                height: 20,
              ),
              SocialLoginButton(
                icon: Image.asset(
                  "assets/images/googleimage.png",
                  height: 22,
                ),
                text: "Sign in with Google",
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Text("Du hast noch keinen Account?",
                        style: TextStyle(color: Colors.white)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(
                              databaseRepository: widget.databaseRepository,
                              authRepository: widget.authRepository,
                            ),
                          ));
                    },
                    child: Text(
                      "Registrieren",
                      style: TextStyle(
                        shadows: const [
                          Shadow(color: Colors.white, offset: Offset(0, -5))
                        ],
                        color: Colors.transparent,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        decorationThickness: 1.35,
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        )));
  }
}

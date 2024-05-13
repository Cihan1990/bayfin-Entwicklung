// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bayfin/src/features/Authentication/presentation/passwort_return_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/registration_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/bay_fin_button.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/social_login_button.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/text_field_auth.dart';
import 'package:bayfin/src/features/Bank%20balance/view_bankaccount.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
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
            child: Column(
              children: [
                const SizedBox(height: 75),
                LogoWidget(width: 385, height: 136),
                const SizedBox(height: 60),
                TextFieldAuth(),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PasswortReturnScreen(),
                            ));
                      },
                      child: Text(
                        "Passwort vergessen",
                        style: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          fontFamily: 'SF Regular',
                          decoration: TextDecoration.underline,
                          decorationColor:
                              const Color(0xFFFFFFFF).withOpacity(0.60),
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFFFFFFFF).withOpacity(0.60),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 18),
                BayFinButton(
                    text: "Login",
                    height: 40,
                    width: 92,
                    navigationWidget: ViewBankaccount()),
                const SizedBox(height: 42),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider(
                          color: Colors.white.withOpacity(0.45),
                          height: 36,
                        )),
                  ),
                  Text(
                    "Oder",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFCBD5E3),
                      fontSize: 14,
                      fontFamily: "SF Pro",
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          const Color(0xFFFFFFFF).withOpacity(0.60),
                      wordSpacing: double.infinity,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Divider(
                          color: Colors.white.withOpacity(0.45),
                          height: 36,
                        )),
                  ),
                ]),
                SizedBox(height: 20),
                SocialLoginButton(
                  icon: Icon(
                    Icons.apple,
                    color: Colors.white,
                    size: 30,
                  ),
                  text: "Sign in with Apple",
                  backgroundColor: Colors.black,
                  fontColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                SocialLoginButton(
                  icon: Image.asset(
                    "lib/assets/images/googleimage.png",
                    height: 22,
                  ),
                  text: "Sign in with Google",
                  backgroundColor: Colors.white,
                  fontColor: Colors.black.withOpacity(0.54),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Du hast noch keinen Account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "SF Pro",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ));
                      },
                      child: Text(
                        "Registrieren",
                        style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.white, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          fontSize: 17,
                          fontFamily: "SF Pro",
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFFFFFFFF),
                          decorationThickness: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

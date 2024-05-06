// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bayfin/src/features/Authentication/presentation/passwort_return_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/registration_screen.dart';
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
                Container(
                  width: 385,
                  height: 136,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/images/bayfinlogo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 54,
                  width: 372,
                  child: TextFormField(
                    style: const TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      fontFamily: 'SF Regular',
                    ),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD3D3D3),
                      contentPadding:
                          const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      filled: true,
                      hintText: "Benutzername / E-Mail Adresse",
                      hintStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: const Color(0x72010000).withOpacity(0.45),
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 26),
                SizedBox(
                  height: 54,
                  width: 372,
                  child: TextFormField(
                    obscureText: !showPassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: const TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      fontFamily: 'SF Pro',
                    ),
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
                      fillColor: const Color(0xFFD3D3D3),
                      contentPadding:
                          const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      filled: true,
                      hintText: "Passwort",
                      hintStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: const Color(0x72010000).withOpacity(0.45)),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
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
                          ))
                    ]),
                const SizedBox(height: 18),
                SizedBox(
                  width: 92,
                  height: 40,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD3D3D3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.65),
                            blurRadius: 15,
                            offset: Offset(0, 15),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          //  Navigator.pushReplacement(
                          //      context,
                          //      MaterialPageRoute(
                          //        builder: (context) => OverviewScreen(
                          //          databaseRepository: widget.databaseRepository,
                          //        ),
                          //      ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD3D3D3),
                            shadowColor: Colors.black.withOpacity(1)),
                        child: Container(
                          child: const Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "SF Pro",
                              fontWeight: FontWeight.bold,
                              wordSpacing: double.infinity,
                            ),
                          ),
                        ),
                      )),
                ),
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
                SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.apple,
                        color: Colors.white,
                        size: 30,
                      ),
                      label: Text(
                        "Sign In with Apple",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        // TODO: login logik einbauen
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => OverviewScreen(
                        //         databaseRepository: widget.databaseRepository,
                        //       ),
                        //     ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        backgroundColor: Colors.black,
                      ),
                    )),
                SizedBox(height: 20),
                SizedBox(
                    width: 300,
                    height: 45,
                    child: ElevatedButton.icon(
                      icon: Image.asset("lib/assets/images/googleimage.png",
                          height: 22),
                      label: Text(
                        "Sign In with Google",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.54),
                          fontSize: 20,
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        // TODO: login logik einbauen
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => OverviewScreen(
                        //         databaseRepository: widget.databaseRepository,
                        //       ),
                        //     ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        backgroundColor: Colors.white,
                      ),
                    )),
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
                          child: Text("Registrieren",
                              style: TextStyle(
                                shadows: const [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -5))
                                ],
                                color: Colors.transparent,
                                fontSize: 17,
                                fontFamily: "SF Pro",
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                decorationColor: const Color(0xFFFFFFFF),
                                decorationThickness: 1.35,
                              ))),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

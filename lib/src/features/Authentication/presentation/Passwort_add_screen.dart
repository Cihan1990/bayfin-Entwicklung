import 'package:bayfin/src/features/Authentication/presentation/account_exist.dart';
import 'package:bayfin/src/features/Authentication/presentation/registration_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/bay_fin_button.dart';
import 'package:flutter/material.dart';

class PasswortAddScreen extends StatefulWidget {
  const PasswortAddScreen({super.key});

  @override
  State<PasswortAddScreen> createState() => _PasswortAddScreenState();
}

class _PasswortAddScreenState extends State<PasswortAddScreen> {
  bool showPassword = false;
  bool showPasswordRepeated = false;

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
              Container(
                width: 217,
                height: 76,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/bayfinlogo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Passwort',
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
              const SizedBox(height: 5),
              TextFormField(
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
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Passwort wiederholen',
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
              const SizedBox(height: 5),
              TextFormField(
                obscureText: !showPasswordRepeated,
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
                        showPasswordRepeated = !showPasswordRepeated;
                      });
                    },
                    icon: showPasswordRepeated
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
                ),
              ),
              const SizedBox(height: 360),
              BayFinButton(
                text: "Benutzerkonto erstellen",
                height: 50,
                width: 247,
                navigationWidget: const AccountExistScreen(),
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
                                    color: Colors.white, offset: Offset(0, -5))
                              ],
                              color: Colors.transparent,
                              fontSize: 15,
                              fontFamily: "SF Pro",
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

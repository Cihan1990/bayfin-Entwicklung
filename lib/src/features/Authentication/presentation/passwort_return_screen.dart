import 'package:bayfin/src/features/Authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/passwort_return_accept_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/bay_fin_button.dart';
import 'package:flutter/material.dart';

class PasswortReturnScreen extends StatefulWidget {
  const PasswortReturnScreen({super.key});

  @override
  State<PasswortReturnScreen> createState() => _PasswortReturnScreenState();
}

class _PasswortReturnScreenState extends State<PasswortReturnScreen> {
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
                  'Benutzername/E-Mail Adresse',
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
                child: const Text(
                  'Neues Passwort',
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
                  'Neues Passwort wiederholen',
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
              const SizedBox(height: 270),
              BayFinButton(
                  text: 'Passwort zurücksetzen',
                  height: 50,
                  width: 247,
                  navigationWidget: const PasswortReturnAcceptScreen()),
              const SizedBox(height: 20),
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

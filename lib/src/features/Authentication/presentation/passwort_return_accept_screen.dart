import 'package:bayfin/src/features/Authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/bay_fin_button.dart';
import 'package:flutter/material.dart';

class PasswortReturnAcceptScreen extends StatefulWidget {
  const PasswortReturnAcceptScreen({super.key});

  @override
  State<PasswortReturnAcceptScreen> createState() =>
      _PasswortReturnAcceptScreenState();
}

class _PasswortReturnAcceptScreenState
    extends State<PasswortReturnAcceptScreen> {
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
                const SizedBox(height: 90),
                const SizedBox(
                    child: Icon(Icons.check_rounded,
                        size: 350, color: Colors.green)),
                const SizedBox(height: 70),
                const SizedBox(
                    child: Text(
                  'Passwort \nzurückgesetzt',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                )),
                const SizedBox(height: 20),
                BayFinButton(
                  text: 'Bestätigen',
                  height: 50,
                  width: 247,
                  navigationWidget: const LoginScreen(),
                ),
              ]),
            ),
          )),
    );
  }
}

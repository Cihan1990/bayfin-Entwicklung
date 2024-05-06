import 'package:bayfin/src/features/Authentication/presentation/login_screen.dart';
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
                SizedBox(
                    width: 247,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFD3D3D3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.65),
                            blurRadius: 15,
                            offset: const Offset(0, 15),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD3D3D3),
                            shadowColor: Colors.black.withOpacity(1)),
                        child: const Text(
                          "Bestätigen",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "SF Pro",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ]),
            ),
          )),
    );
  }
}

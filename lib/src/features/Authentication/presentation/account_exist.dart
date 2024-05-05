// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountExistScreen extends StatefulWidget {
  const AccountExistScreen({super.key});

  @override
  State<AccountExistScreen> createState() => _AccountExistScreenState();
}

class _AccountExistScreenState extends State<AccountExistScreen> {
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
                const SizedBox(height: 90),
                const SizedBox(
                    child: Icon(Icons.check_rounded,
                        size: 350, color: Colors.green)),
                const SizedBox(height: 70),
                const SizedBox(
                    child: Text(
                  'Benutzerkonto\nerstellt',
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
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => PasswortAddScreen(),
                          //     ));
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

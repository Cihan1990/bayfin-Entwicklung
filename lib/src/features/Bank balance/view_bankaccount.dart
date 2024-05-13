import 'package:bayfin/src/features/Authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/main_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/main_screen2.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/bay_fin_button.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/logo_widget.dart';
import 'package:flutter/material.dart';

class ViewBankaccount extends StatefulWidget {
  const ViewBankaccount({super.key});

  @override
  State<ViewBankaccount> createState() => _ViewBankaccountState();
}

class _ViewBankaccountState extends State<ViewBankaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 29,
          backgroundColor: const Color(0xFFE6E9FF),
          leading: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  )),
              IconButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen(),
                    // ));
                  },
                  icon: const Icon(
                    Icons.add_card,
                    size: 24,
                  )),
            ],
          ),
          leadingWidth: 200,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                icon: const Icon(
                  Icons.logout,
                  size: 24,
                ))
          ],
        ),
        body: Container(
            width: 393,
            height: 852,
            decoration: const BoxDecoration(color: Color(0xFFE6E9FF)),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                    child: Column(children: [
                  const SizedBox(height: 10),
                  LogoWidget(width: 217, height: 76),
                  const SizedBox(height: 20),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: Text(
                            'Übersicht ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ]),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: Text(
                          'Girokonto',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  BayFinButton(
                    text: 'Girokonto\nDE12600501010001234567',
                    height: 80,
                    width: 361,
                    navigationWidget: const MainScreen(),
                    color: const Color(0xFF212C95),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                    shadow: false,
                  ),
                  const SizedBox(height: 15),
                  BayFinButton(
                    text: 'Girokonto\nDE12600501010005678904',
                    height: 80,
                    width: 361,
                    navigationWidget: const MainScreen2(),
                    color: const Color(0xFF212C95),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                    shadow: false,
                  ),
                ])))));
  }
}

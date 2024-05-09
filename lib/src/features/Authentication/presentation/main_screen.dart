import 'package:bayfin/src/features/Authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/bay_fin_button.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/operator_info.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 29,
          backgroundColor: const Color(0xFFE6E9FF),
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
              const SizedBox(height: 0),
              LogoWidget(width: 217, height: 76),
              const SizedBox(height: 20),
              const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(width: 10),
                SizedBox(
                  width: 96,
                  height: 20,
                  child: Text(
                    'Guten Tag ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
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
                  SizedBox(width: 6),
                  SizedBox(
                    width: 113,
                    height: 40,
                    child: Text(
                      'Cihan!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // w361 - h80 const Color(0xFF212C95)
              BayFinButton(
                text: 'Girokonto\n1.890,69€',
                height: 80,
                width: 361,
                navigationWidget: const LoginScreen(),
                color: const Color(0xFF212C95),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
                shadow: false,
              ),
              const SizedBox(height: 15),
              Container(
                width: 365,
                height: 226,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('lib/assets/images/aktienbild.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                  width: 361,
                  height: 220,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF212C95),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Letzte Umsätze          ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      TransactionInfo(
                          firmLogoPath: "lib/assets/images/vodafonelogo.png",
                          amount: -100.00,
                          firmName: "Vodafone"),
                      TransactionInfo(
                          firmLogoPath: "lib/assets/images/hmlogo.png",
                          amount: -80.00,
                          firmName: "H&M"),
                      TransactionInfo(
                          firmLogoPath: "lib/assets/images/amazonlogo.png",
                          amount: -160.00,
                          firmName: "Amazon")
                    ],
                  )),
            ])),
          ),
        ));
  }
}

import 'package:bayfin/src/features/Authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/logo_widget.dart';
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
              const SizedBox(height: 20),
              Container(
                width: 361,
                height: 80,
                decoration: ShapeDecoration(
                  color: const Color(0xFF212C95),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Girokonto\n1.890,69€',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: 365,
                height: 226,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('lib/assets/Images/aktienbild.png'),
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
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  'Letzte Umsätze          ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              )
            ])),
          ),
        ));
  }
}

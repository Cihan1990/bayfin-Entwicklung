import 'package:bayfin/src/features/Authentication/presentation/login_screen.dart';
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
                  const SizedBox(
                    width: 96,
                    height: 20,
                    child: Text(
                      'Guten Tag ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 113,
                    height: 40,
                    child: Text(
                      'Cihan!',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
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
                  )
                ]),
              ),
            )));
  }
}

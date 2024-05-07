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
        body: Container(
            width: 393,
            height: 852,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 191, 197, 244)),
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
                  ]),
                ))));
  }
}

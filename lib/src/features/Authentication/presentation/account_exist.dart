// ignore_for_file: sort_child_properties_last

import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/login_screen.dart';
import 'package:flutter/material.dart';

class AccountExistScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  // Konstruktor
  const AccountExistScreen({super.key, required this.databaseRepository});

  @override
  State<AccountExistScreen> createState() => _AccountExistScreenState();
}

class _AccountExistScreenState extends State<AccountExistScreen> {
  bool showPassword = false;
  bool showPasswordRepeated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SizedBox(
          width: 393,
          height: 852,
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
                      image: AssetImage('assets/images/bayfinlogo.png'),
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
                  'Benutzerkonto\nerstellt!',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.center,
                )),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Bestätigen'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen(
                                  databaseRepository: widget.databaseRepository,
                                )));
                  },
                ),
              ]),
            ),
          )),
    );
  }
}

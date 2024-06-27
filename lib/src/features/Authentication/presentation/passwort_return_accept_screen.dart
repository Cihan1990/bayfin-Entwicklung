import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/login_screen.dart';
import 'package:flutter/material.dart';

class PasswortReturnAcceptScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  const PasswortReturnAcceptScreen(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  State<PasswortReturnAcceptScreen> createState() =>
      _PasswortReturnAcceptScreenState();
}

class _PasswortReturnAcceptScreenState
    extends State<PasswortReturnAcceptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
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
                child:
                    Icon(Icons.check_rounded, size: 350, color: Colors.green)),
            const SizedBox(height: 100),
            const SizedBox(
                child: Text(
              'Passwort \nzurückgesetzt!',
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
                      authRepository: widget.authRepository,
                    ),
                  ),
                );
              },
            ),
          ]),
        ),
      )),
    );
  }
}

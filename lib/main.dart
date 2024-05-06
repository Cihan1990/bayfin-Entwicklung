import 'package:bayfin/src/features/Authentication/presentation/home_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/passwort_return_accept_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/passwort_return_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/registration_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PasswortReturnScreen(),
    );
  }
}

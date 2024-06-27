import 'package:bayfin/firebase_options.dart';
import 'package:bayfin/src/app.dart';
import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/data/mock_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DatabaseRepository databaseRepository = MockDatabase();
  AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);

  runApp(App(
    databaseRepository: databaseRepository,
    authRepository: authRepository,
  ));
}

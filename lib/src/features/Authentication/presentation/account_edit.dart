import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/application/validators.dart';
import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/authentication/presentation/login_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/pronouns.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/registrations_text.dart';
import 'package:bayfin/src/features/bank_balance/presentation/view_bankaccount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountEditScreen extends StatefulWidget {
  const AccountEditScreen({super.key});

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  late TextEditingController vornameController;
  late TextEditingController nachnameController;
  late TextEditingController geburtsdatumController;
  late TextEditingController mailController;
  late TextEditingController pronounsController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    vornameController = TextEditingController();
    nachnameController = TextEditingController();
    geburtsdatumController = TextEditingController();
    mailController = TextEditingController();
    pronounsController = TextEditingController();
  }

  @override
  void dispose() {
    vornameController.dispose();
    nachnameController.dispose();
    geburtsdatumController.dispose();
    mailController.dispose();
    pronounsController.dispose();
    super.dispose();
  }

  Future<void> _deleteAccount(String userId) async {
    try {
      await context.read<DatabaseRepository>().deleteUserData(userId);
      if (!context.mounted) return;
      if (!mounted) return;

      await context.read<AuthRepository>().deleteAccount(userId);
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Fehler beim Löschen des Accounts!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthRepository>().getUserId();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder<Benutzer?>(
              future: context.read<DatabaseRepository>().loadUserData(userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Fehler: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Icon(Icons.error);
                } else {
                  final Benutzer user = snapshot.data!;
                  // Initialize controllers with user data
                  vornameController.text = user.vorname;
                  nachnameController.text = user.nachname;
                  geburtsdatumController.text = user.geburtsdatum ?? '';
                  mailController.text = user.email;
                  pronounsController.text = user.anrede ?? '';

                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 55),
                        Row(
                          children: [
                            const Spacer(
                              flex: 3,
                            ),
                            LogoWidget(width: 217, height: 76),
                            const Spacer(),
                            IconButton(
                              onPressed: () => _deleteAccount(userId),
                              icon: const Icon(Icons.delete_forever),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text('Persönliche Daten',
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -5))
                                ],
                                color: Colors.transparent,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFFFFFFF),
                                decorationThickness: 1.35)),
                        const SizedBox(height: 25),
                        Prounouns(
                          text: '  Anrede',
                          controller: pronounsController,
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 15),
                        RegistrationsText(
                          controller: vornameController,
                          text: '  Vorname',
                          validator: validateVn,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 10),
                        RegistrationsText(
                          controller: nachnameController,
                          text: '  Nachname',
                          validator: validateNn,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 10),
                        RegistrationsText(
                          controller: geburtsdatumController,
                          text: '  Geburtsdatum',
                          hinttext: 'TT.MM.JJJJ',
                          validator: validateGb,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 10),
                        RegistrationsText(
                          controller: mailController,
                          validator: validateEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          text: '  E-Mail Adresse',
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 110),
                        ElevatedButton(
                          child: const Text('Änderungen übernehmen'),
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              final updatedUser = Benutzer(
                                  vorname: vornameController.text,
                                  nachname: nachnameController.text,
                                  geburtsdatum: geburtsdatumController.text,
                                  email: mailController.text,
                                  anrede: pronounsController.text,
                                  userid: userId);

                              await context
                                  .read<DatabaseRepository>()
                                  .updateUserData(userId, updatedUser);
                              if (!context.mounted) return;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ViewBankaccount(),
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ViewBankaccount(),
                                  ),
                                );
                              },
                              child: const Text("Zurück zur Kontoübersicht",
                                  style: TextStyle(
                                    shadows: [
                                      Shadow(
                                          color: Colors.white,
                                          offset: Offset(0, -5))
                                    ],
                                    color: Colors.transparent,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFFFFFFF),
                                    decorationThickness: 1.35,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}

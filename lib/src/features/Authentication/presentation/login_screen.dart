import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/passwort_return_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/registration_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/social_login_button.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/text_field_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _mailController;
  late TextEditingController _pwController;

  @override
  void initState() {
    super.initState();
    _mailController = TextEditingController();
    _pwController = TextEditingController();
  }

  @override
  void dispose() {
    _mailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  signInWithGoogle() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 8,
          ),
        );
      },
    );

    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Überprüfe, ob der Benutzer bereits angemeldet ist
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }

      // Beginn des Anmeldevorgangs
      final GoogleSignInAccount? gUser = await googleSignIn.signIn();

      if (gUser == null) {
        Navigator.pop(context);

        return;
      }

      // Authentifizierungsdetails von der Anfrage abrufen
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Erstellen eines neuen Anmeldecredentials
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Anmelden mit dem Credential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        Navigator.pop(context);
        FirebaseAnalytics.instance.logSignUp(signUpMethod: "GoogleSignIn");
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Google sign-in failed. Please try again later.",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "An error occurred: ${e.toString()}",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  bool showPassword = false;
  bool showCreateAccountNotification = false;

  @override
  Widget build(BuildContext context) {
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 10)
            .copyWith(bottom: 0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: bottomInsets),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoWidget(width: 340, height: 136),
                ],
              ),
              Form(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    TextFieldAuth(
                      mailController: _mailController,
                      pwController: _pwController,
                    ),
                    if (showCreateAccountNotification)
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Erstelle dir ein Account!",
                                style: TextStyle(
                                  textBaseline: TextBaseline.alphabetic,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade200,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PasswortReturnScreen()));
                            },
                            child: const Text(
                              "Passwort vergessen",
                              style: TextStyle(
                                textBaseline: TextBaseline.alphabetic,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 28),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await context
                              .read<AuthRepository>()
                              .loginWithEmailAndPassword(
                                  _mailController.text, _pwController.text);
                          setState(() {
                            showCreateAccountNotification = false;
                          });
                        } catch (e) {
                          setState(() {
                            showCreateAccountNotification = true;
                          });
                        }
                      },
                      child: const Text("Login"),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 35),
                      child: Row(children: <Widget>[
                        Expanded(child: Divider(color: Colors.white)),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Oder",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.white)),
                      ]),
                    ),
                    SocialLoginButton(
                      icon: const Icon(
                        Icons.apple,
                        color: Colors.black,
                        size: 30,
                      ),
                      text: "Sign in with Apple",
                      onpressed: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SocialLoginButton(
                        icon: Image.asset(
                          "assets/images/googleimage.png",
                          height: 22,
                        ),
                        text: "Sign in with Google",
                        onpressed: signInWithGoogle),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Text(
                            "Du hast noch keinen Account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationScreen(),
                                  ));
                            },
                            child: const Text(
                              "Registrieren",
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -5))
                                ],
                                color: Colors.transparent,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                decorationThickness: 1.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

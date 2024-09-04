import 'dart:convert';

import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/passwort_return_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/registration_screen.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/social_login_button.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/text_field_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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

  Future<void> signInWithApple() async {
    try {
      final AuthorizationCredentialAppleID credential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      if (credential.identityToken == null) {
        throw Exception("Missing authorization credentials from Apple");
      }

      final OAuthCredential oAuthCredential =
          OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
      //print(credential.givenName);
      if (!mounted) return;
      final provider = Provider.of<DatabaseRepository>(context, listen: false);

      if (userCredential.user != null) {
        //  Future<Benutzer?> nutzer = provider.loadUserData(userCredential.user!.uid);
        if (userCredential.additionalUserInfo!.isNewUser) {
          // Handle optional fields from Apple ID
          final String? email = userCredential.user?.email;
          final String? uid = userCredential.user?.uid;
          final String vorname = credential.givenName ?? "";
          final String nachname = credential.familyName ?? "";
          const String anrede = "";
          const String geburtsdatum = "";

          await provider.submitRegistrationData(
            anrede,
            vorname,
            nachname,
            geburtsdatum,
            email ?? "",
            uid ?? "",
          );
        }
        if (!mounted) return;

        Navigator.pop(context);
        FirebaseAnalytics.instance.logSignUp(signUpMethod: "AppleSignIn");
      } else {
        throw Exception("Apple sign-in returned a null user.");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Apple Sign-In abgebrochen!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ));
    }
  }

  Future<Map<String, String>> getGoogleProfileDetails(
      GoogleSignInAccount googleUser) async {
    final headers = await googleUser.authHeaders;
    final response = await http.get(
      Uri.parse(
          "https://people.googleapis.com/v1/people/me?personFields=names,birthdays,genders"),
      headers: {"Authorization": headers["Authorization"] ?? ''},
    );

    if (response.statusCode == 200) {
      final profile = jsonDecode(response.body);
      final name = profile["names"]?[0]["displayName"] ?? "";
      final givenName = profile["names"]?[0]["givenName"] ?? "";
      final familyName = profile["names"]?[0]["familyName"] ?? "";
      final gender = profile["genders"]?[0]["formattedValue"] ?? "";
      final birthday = profile["birthdays"]?[0]["date"] != null
          ? "${profile["birthdays"][0]["date"]["day"]}.${profile["birthdays"][0]["date"]["month"]}.${profile["birthdays"][0]["date"]["year"]}"
          : "";

      return {
        "name": name,
        "vorname": givenName,
        "nachname": familyName,
        "anrede": gender,
        "geburtsdatum": birthday,
      };
    } else {
      return {
        "name": "",
        "vorname": "",
        "nachname": "",
        "anrede": "",
        "geburtsdatum": ""
      };
    }
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
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
        'https://www.googleapis.com/auth/user.birthday.read',
        'https://www.googleapis.com/auth/user.gender.read'
      ]);

      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }

      final GoogleSignInAccount? gUser = await googleSignIn.signIn();

      if (gUser == null) {
        if (!mounted) return;
        Navigator.pop(context);
        return;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (!mounted) return;
      final provider = Provider.of<DatabaseRepository>(context, listen: false);

      if (userCredential.user != null) {
        final profileDetails = await getGoogleProfileDetails(gUser);
        final anrede = profileDetails["anrede"] != null
            ? profileDetails["anrede"] == "Male"
                ? "Herr"
                : "Frau"
            : "";

        await provider.submitRegistrationData(
          anrede,
          profileDetails["vorname"] ?? "",
          profileDetails["nachname"] ?? "",
          profileDetails["geburtsdatum"] ?? "",
          userCredential.user?.email ?? "",
          userCredential.user?.uid ?? "",
        );

        if (!mounted) return;

        Navigator.pop(context);
        FirebaseAnalytics.instance.logSignUp(signUpMethod: "GoogleSignIn");
      } else {
        if (!context.mounted) return;
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
      if (!context.mounted) return;
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          "Google Sign-In abgebrochen!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
                      onpressed: () {
                        signInWithApple();
                        debugPrint("$signInWithApple");
                      },
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

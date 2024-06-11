import 'package:flutter/material.dart';

class TextFieldAuth extends StatefulWidget {
  const TextFieldAuth({
    super.key,
  });

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 372,
          child: TextFormField(
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.grey.shade400),
              contentPadding:
                  const EdgeInsets.only(top: 0.0, left: 10, right: 10),
              filled: true,
              hintText: "Benutzername / E-Mail Adresse",
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateName,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 26),
        SizedBox(
          width: 372,
          child: TextFormField(
            obscureText: !showPassword,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.grey.shade400),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: showPassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              filled: true,
              hintText: "Passwort",
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validatePw,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  String? validateName(String? input) {
    if (input == null || input.isEmpty) {
      return "Bitte Buntzername/E-Mail Adresse eingeben";
    }
    if (input.contains("@")) {
      return 'Bitte geben sie ihre E-Mail Adresse ein';
    }
    if (!(input.contains("@")) &&
        !(input.endsWith(".com")) &&
        !(input.endsWith(".de"))) {
      return 'Bitte geben sie einen Benutzernamen ein';
    }
    return null;
  }

  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return "Bitte Passwort eingeben";
    }
    if (input.length < 6 || input.length > 12) {
      return "Passwort muss zwischen 6 und maximal 12 Zeichen lang sein";
    }
    return null;
  }
}

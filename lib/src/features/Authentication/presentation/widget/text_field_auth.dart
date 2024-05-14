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
          height: 54,
          width: 372,
          child: TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(top: 0.0, left: 10, right: 10),
              filled: true,
              hintText: "Benutzername / E-Mail Adresse",
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 26),
        SizedBox(
          height: 54,
          width: 372,
          child: TextFormField(
            obscureText: !showPassword,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
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
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}

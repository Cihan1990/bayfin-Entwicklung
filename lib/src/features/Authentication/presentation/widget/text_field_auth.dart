import 'package:flutter/material.dart';

class TextFieldAuth extends StatefulWidget {
  TextFieldAuth({
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
            style: const TextStyle(
              textBaseline: TextBaseline.alphabetic,
              fontFamily: 'SF Regular',
            ),
            decoration: InputDecoration(
              fillColor: const Color(0xFFD3D3D3),
              contentPadding:
                  const EdgeInsets.only(top: 0.0, left: 10, right: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.0),
              ),
              filled: true,
              hintText: "Benutzername / E-Mail Adresse",
              hintStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: const Color(0x72010000).withOpacity(0.45),
              ),
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
            style: const TextStyle(
              textBaseline: TextBaseline.alphabetic,
              fontFamily: 'SF Pro',
            ),
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
              fillColor: const Color(0xFFD3D3D3),
              contentPadding:
                  const EdgeInsets.only(top: 0.0, left: 10, right: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.0),
              ),
              filled: true,
              hintText: "Passwort",
              hintStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: const Color(0x72010000).withOpacity(0.45)),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}

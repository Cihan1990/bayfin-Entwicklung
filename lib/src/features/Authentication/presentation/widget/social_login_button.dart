// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  Widget icon;
  String text;

  SocialLoginButton({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton.icon(
        icon: icon,
        label: Text(
          text,
        ),
        onPressed: () {
        
        },
      ),
    );
  }
}

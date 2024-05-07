// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  Widget icon;
  String text;
  Color backgroundColor;
  Color fontColor;

  SocialLoginButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.backgroundColor,
      required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton.icon(
        icon: icon,
        label: Text(
          text,
          style: TextStyle(
            color: fontColor,
            fontSize: 20,
            fontFamily: "SF Pro Display",
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          // TODO: login logik einbauen
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => OverviewScreen(
          //         databaseRepository: widget.databaseRepository,
          //       ),
          //     ));
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}

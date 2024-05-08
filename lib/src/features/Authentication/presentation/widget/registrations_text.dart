// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RegistrationsText extends StatelessWidget {
  String text;
  String? hinttext;
  TextStyle? hintstyle;

  RegistrationsText({
    super.key,
    required this.text,
    this.hintstyle,
    this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            decorationColor: Color(0xFFFFFFFF),
            decorationThickness: 1.35,
          ),
        ),
      ),
      TextFormField(
          decoration: InputDecoration(
        fillColor: const Color(0xFFD3D3D3),
        contentPadding: const EdgeInsets.only(top: 0.0, left: 10, right: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.0),
        ),
        filled: true,
        hintText: hinttext,
        hintStyle: hintstyle,
      ))
    ]);
  }
}

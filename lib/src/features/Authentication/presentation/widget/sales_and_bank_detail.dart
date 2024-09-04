// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SalesAndBankDetail extends StatelessWidget {
  final String text;
  final String? hinttext;
  final TextStyle? hintstyle;
  final Color? color;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keybordtype;

  const SalesAndBankDetail(
      {super.key,
      required this.text,
      this.hintstyle,
      required this.controller,
      this.hinttext,
      required this.validator,
      required this.autovalidateMode,
      this.keybordtype,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
            decorationThickness: 1.35,
          ),
        ),
      ),
      TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keybordtype,
          autovalidateMode: autovalidateMode,
          decoration: InputDecoration(
            //errorStyle: TextStyle(color: Colors.grey.shade400),
            fillColor: const Color(0xffE6E9FF),
            errorStyle: const TextStyle(color: Colors.red),
            contentPadding:
                const EdgeInsets.only(top: 0.0, left: 10, right: 10),
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

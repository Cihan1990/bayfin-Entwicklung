/* // ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BayFinButton extends StatelessWidget {
  Widget? navigationWidget;
  String text;
  String? iban;
  double height;
  double width;
  Color? color;
  bool shadow;

  BayFinButton({super.key});
  ElevatedButton(tStyle;
  ElevatedButton(
      {super.key,
      this.navigationWidget,
      this.color,
      required this.text,
      this.iban,
      required this.height,
      this.shadow = true,
      this.textStyle = const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: "SF Pro",
        fontWeight: FontWeight.bold,
      ),
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => navigationWidget!));
        },
        child: Column(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
            Visibility(
              visible: iban != null,
              child: Text(
                iban ?? "",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      )),
    );
  }
 */ 

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BayFinButton extends StatelessWidget {
  Widget? navigationWidget;
  String text;
  double height;
  double width;
  Color? color;
  bool shadow;
  TextStyle textStyle;
  BayFinButton(
      {super.key,
      this.navigationWidget,
      this.color,
      required this.text,
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
          decoration: BoxDecoration(
            color: color ?? const Color(0xFFD3D3D3),
            boxShadow: [
              BoxShadow(
                color: shadow
                    ? Colors.black.withOpacity(0.65)
                    : Colors.transparent,
                blurRadius: 15,
                offset: const Offset(0, 15),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => navigationWidget!));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: color ?? const Color(0xFFD3D3D3)),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          )),
    );
  }
}

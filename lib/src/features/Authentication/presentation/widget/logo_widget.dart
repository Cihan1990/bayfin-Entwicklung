// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  double width;
  double height;

  LogoWidget({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bayfinlogo.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

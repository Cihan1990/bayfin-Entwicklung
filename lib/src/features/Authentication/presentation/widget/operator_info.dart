// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TransactionInfo extends StatelessWidget {
  String firmLogoPath;
  String firmName;
  double amount;
  TransactionInfo({
    super.key,
    required this.amount,
    required this.firmName,
    required this.firmLogoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(firmLogoPath),
                    fit: BoxFit.fill,
                  ),
                )),
            Text(
              firmName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            Text("${amount.toStringAsFixed(2)}€",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ))
          ],
        ));
  }
}

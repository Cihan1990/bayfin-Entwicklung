// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TransactionInfo extends StatelessWidget {
  String? firmLogoPath;
  String? firmName;
  double? amount;

  TransactionInfo({
    super.key,
    this.amount,
    this.firmName,
    this.firmLogoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 29,
                height: 29,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(firmLogoPath!),
                    fit: BoxFit.fill,
                  ),
                )),
            Text(
              firmName!,
            ),
            Text("${amount?.toStringAsFixed(2)}€",
                style: TextStyle(
                  color: amount! < 0 ? Colors.red : Colors.green,
                  fontSize: 14,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ))
          ],
        ));
  }
}

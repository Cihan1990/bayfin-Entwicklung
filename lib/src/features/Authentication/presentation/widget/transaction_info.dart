// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TransactionInfo extends StatelessWidget {
  String? firmLogoPath;
  String? firmName;
  double? amount;
  bool type;

  TransactionInfo({
    super.key,
    required this.type,
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    image: AssetImage("assets/images/platzhalter.jpeg"),
                    fit: BoxFit.fill,
                  ),
                )),
            Text(
              firmName!,
            ),
            Text("${amount?.toStringAsFixed(2)}€",
                style: TextStyle(
                  color: type ? Colors.green : Colors.red,
                  fontSize: 14,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ))
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class BankaccountSelector extends StatefulWidget {
  final TextEditingController controller;
  const BankaccountSelector({super.key, required this.controller});

  @override
  State<BankaccountSelector> createState() => _BankaccountSelectorState();
}

class _BankaccountSelectorState extends State<BankaccountSelector> {
  List<String> bankaccount = ["Girokonto", "Sparbuch", "Tagesgeldkonto"];
  String initialvalue = "Girokonto";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        underline: Container(
          height: 2,
          color: Colors.blue.shade900,
        ),
        value: initialvalue,
        items: bankaccount.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            initialvalue = value!;
            widget.controller.text = value;
          });
        });
  }
}

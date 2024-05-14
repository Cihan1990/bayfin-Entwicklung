// ignore_for_file: override_on_non_overriding_member, no_logic_in_create_state, must_be_immutable

import 'package:flutter/material.dart';

class Prounouns extends StatefulWidget {
  String text;
  Prounouns({super.key, required this.text});

  @override
  State<Prounouns> createState() => _ProunounsState();
}

class _ProunounsState extends State<Prounouns> {
  List<String> genders = ["", "Herr", "Frau", "Divers"];
  late String selectedGenders = genders.first;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          style: const TextStyle(color: Colors.white),
          widget.text,
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
            height: 45,
            width: 115,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
                color: const Color(0xffE6E9FF),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: selectedGenders,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGenders = newValue!;
                      });
                    },
                    items: genders.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList())))
      ])
    ]);
  }
}

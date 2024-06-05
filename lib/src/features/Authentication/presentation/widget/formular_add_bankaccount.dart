// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/registrations_text.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:flutter/material.dart';

class FormularAddBankaccount extends StatefulWidget {
  const FormularAddBankaccount(
      {super.key,
      this.KontoInformation,
      required this.database,
      required this.userid});
  final DatabaseRepository database;
  final String userid;
  final KontoInformation;

  @override
  State<FormularAddBankaccount> createState() => _FormularAddBankaccountState();
}

class _FormularAddBankaccountState extends State<FormularAddBankaccount> {
  final _formKey = GlobalKey<FormState>();
  final _bankController = TextEditingController();
  final _ibanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: RegistrationsText(
              controller: _bankController,
              text: 'Bank',
              validator: validateBk,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: RegistrationsText(
              controller: _ibanController,
              text: 'IBAN',
              validator: validateIban,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              child: const Text('Bankkonto hinzufügen'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final neueKontoInformation = KontoInformation(
                      bank: _bankController.text, iban: _ibanController.text);
                  widget.database.addKonto(neueKontoInformation, widget.userid);
                  Navigator.of(context).pop();

                  _formKey.currentState!.save();
                }
              },
            ),
          )
        ]));
  }
}

String? validateIban(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte IBAN eingeben';
  }
  return null;
}

String? validateBk(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte Konto eingeben';
  }
  return null;
}
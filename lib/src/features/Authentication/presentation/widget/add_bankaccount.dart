import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/application/validators.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBankaccount extends StatefulWidget {
  const AddBankaccount({super.key});

  @override
  State<AddBankaccount> createState() => _AddBankaccountState();
}

class _AddBankaccountState extends State<AddBankaccount> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController bankController;
  late TextEditingController ibanController;
  late TextEditingController ksController;

  @override
  void initState() {
    bankController = TextEditingController();
    ibanController = TextEditingController();
    ksController = TextEditingController();
  }

  @override
  void dispose() {
    bankController.dispose();
    ibanController.dispose();
    ksController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
                    key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                controller: bankController,
                                decoration:
                                    const InputDecoration(labelText: 'Bank'),
                                validator: validateBk,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                controller: ibanController,
                                decoration:
                                    const InputDecoration(labelText: 'IBAN'),
                                validator: validateIban,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                controller: ksController,
                                decoration: const InputDecoration(
                                    labelText: 'Kontostand'),
                                keyboardType: TextInputType.number,
                                validator: validateKS,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                child: const Text('Bankkonto hinzufügen'),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    double? kontostand;
                                    if (ksController.text.isNotEmpty) {
                                      kontostand =
                                          double.tryParse(ksController.text);
                                    }
                                    await context
                                        .read<DatabaseRepository>()
                                        .addKonto(
                                          KontoInformation(
                                            bank: bankController.text,
                                            iban: ibanController.text,
                                            kontostand: kontostand,
                                          ),
                                          context
                                              .read<AuthRepository>()
                                              .getUserId(),
                                        );
                                    bankController.clear();
                                    ibanController.clear();
                                    ksController.clear();
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      );
  }
}
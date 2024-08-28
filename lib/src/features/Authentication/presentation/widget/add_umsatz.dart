import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/application/validators.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/sales_and_bank_detail.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUmsatz extends StatefulWidget {
  final KontoInformation kontoInformation;
  const AddUmsatz({super.key, required this.kontoInformation});

  @override
  State<AddUmsatz> createState() => _AddUmsatzState();
}

class _AddUmsatzState extends State<AddUmsatz> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController umzatzbezeichnungController;
  late TextEditingController umsatzsummeController;

  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    umzatzbezeichnungController = TextEditingController();
    umsatzsummeController = TextEditingController();
  }

  @override
  void dispose() {
    umsatzsummeController.dispose();
    umzatzbezeichnungController.dispose();

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
              child: SalesAndBankDetail(
                controller: umzatzbezeichnungController,
                validator: validateUmsatzbz,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                text: 'Umsatzbezeichnung',
                color: Colors.black,
              )),
          Padding(
              padding: const EdgeInsets.all(8),
              child: SalesAndBankDetail(
                  controller: umsatzsummeController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validateUmsatzsumme,
                  text: 'Umsatzsumme',
                  color: Colors.black)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              child: const Text('Umsatz hinzufügen'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final userId =
                      context.read<AuthRepository>().getCurrentUser()!.uid;

                  await context.read<DatabaseRepository>().addUmsatz(
                      Umsatz(
                          betrag: double.parse(umsatzsummeController.text),
                          umsatzname: umzatzbezeichnungController.text,
                          date:
                              '${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year}',
                          type:
                              checkIfUmsatzIsMinus(umsatzsummeController.text)),
                      userId,
                      widget.kontoInformation.documentReference!.id);

                  setState(() {
                    final updatedInfo = widget.kontoInformation;
                    updatedInfo.kontostand = updatedInfo.kontostand! +
                        double.parse(umsatzsummeController.text);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                    context
                        .read<DatabaseRepository>()
                        .updateKonto(updatedInfo, userId);
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

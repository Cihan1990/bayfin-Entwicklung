import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BayFinButtonList extends StatelessWidget {
  final List<KontoInformation> kontoInfos;
  const BayFinButtonList({Key? key, required this.kontoInfos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: kontoInfos.map((info) => _buildDismissibleCard(context, info)).toList(),
    );
  }

  Widget _buildDismissibleCard(BuildContext context, KontoInformation info) {
    return Column(
      children: [
        Dismissible(
          key: Key(info.iban),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) async {
            await context.read<DatabaseRepository>().deleteKonto(
                info.iban, context.read<AuthRepository>().getUserId());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Konto ${info.bank} gelöscht')),
            );
          },
          child: SizedBox(
            width: 361,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(kontoInformation: info),
                  ),
                );
              },
              child: Card(
                color: const Color.fromARGB(255, 180, 183, 249),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Text(
                        "Girokonto",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        info.iban,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
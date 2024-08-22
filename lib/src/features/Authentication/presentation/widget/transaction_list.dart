import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/transaction_info.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionListWidget extends StatelessWidget {
  final String userId;
  final String kontoId;

  const TransactionListWidget({
    super.key,
    required this.userId,
    required this.kontoId,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Umsatz>>(
      stream: context.read<DatabaseRepository>().getUmsatz(userId, kontoId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Icon(Icons.error);
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          List<Umsatz> umsatzliste = snapshot.data!;
          List<TransactionInfo> transactionliste = [];

          for (var i = 0; i < umsatzliste.length && i < 3; i++) {
            var u = umsatzliste[i];
            transactionliste.add(TransactionInfo(
              firmName: u.umsatzname,
              type: u.type,
              amount: u.betrag,
              date: u.date.toString(),
            ));
          }

          return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 180, 183, 249),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            width: 361,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),
                ...transactionliste,
              ],
            ),
          );
        } else {
          return const Text("No Data");
        }
      },
    );
  }
}

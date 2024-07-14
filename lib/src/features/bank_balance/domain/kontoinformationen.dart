import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KontoInformation {
  String iban;
  String? bic;
  String bank;
  double? kontostand;
  // double userId;
  DocumentReference? documentReference;
  List<Umsatz>? transactions;
  

  KontoInformation({
    required this.bank,
    this.bic,
    required this.iban,
    this.kontostand,
    this.transactions,
    this.documentReference
    // required this.userId,
  });
  Map<String, dynamic> toMap() {
    return {
      "bic": bic,
      "iban": iban,
      "bank": bank,
      "kontostand": kontostand,
      "transactions": transactions
      // "userId": userId,
    };
  }


  factory KontoInformation.fromMap(Map<String, dynamic> map, DocumentReference ref) {
    return KontoInformation(
      bank: map["bank"],
      iban: map["iban"],
      bic: map["bic"],
      kontostand: map["kontostand"]?.toDouble(),
      transactions: map["transactions"],
      documentReference: ref
      // userId: map["userId"],
    );
  }
}




// db.collection("cities").get().then(
//   (querySnapshot) {
//     print("Successfully completed");
//     for (var docSnapshot in querySnapshot.docs) {
//       print('${docSnapshot.id} => ${docSnapshot.data()}');
//     }
//   },
//   onError: (e) => print("Error completing: $e"),
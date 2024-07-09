import 'package:cloud_firestore/cloud_firestore.dart';

class KontoInformation {
  String iban;
  String? bic;
  String bank;
  double? kontostand;
  // double userId;
  DocumentReference? documentReference;

  KontoInformation({
    required this.bank,
    this.bic,
    required this.iban,
    this.kontostand,
    // required this.userId,
    
  });
  Map<String, dynamic> toMap() {
    return {
      "bic": bic,
      "iban": iban,
      "bank": bank,
      "kontostand": kontostand,
      // "userId": userId,
    };
  }

  factory KontoInformation.fromMap(Map<String, dynamic> map) {
    return KontoInformation(
      bank: map["bank"],
      iban: map["iban"],
      bic: map["bic"],
      kontostand: map["kontostand"]?.toDouble(),
      // userId: map["userId"],
    );
  }
}

import 'package:bayfin/src/features/authentication/domain/name.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Benutzer {
  Name benutzername;
  String email;
  String telefon;
  List<KontoInformation> bank;
  List<Umsatz> umsatze;
  String userid;
  DocumentReference? documentReference;

  Benutzer({
    required this.benutzername,
    required this.email,
    required this.telefon,
    required this.bank,
    required this.umsatze,
    required this.userid,
  });

  Map<String, dynamic> toMap() {
    return {
      "benutzername": benutzername.toMap(),
      "bank": bank.map((konto) => konto.toMap()).toList(),
      "umsatze": umsatze.map((umsatz) => umsatz.toMap()).toList(),
      "email": email,
      "telefon": telefon,
      "userid": userid,
    };
  }

  factory Benutzer.fromMap(Map<String, dynamic> map) {
    return Benutzer(
      benutzername: Name.fromMap(map["benutzername"]),
      email: map["email"],
      telefon: map["telefon"],
      bank: List<KontoInformation>.from(
          map["bank"].map((konto) => KontoInformation.fromMap(konto))),
      umsatze: List<Umsatz>.from(
          map["umsatze"].map((umsatz) => Umsatz.fromMap(umsatz))),
      userid: map["userid"],
    );
  }
}

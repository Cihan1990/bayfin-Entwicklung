import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Benutzer {
  String vorname;
  String nachname;
  String email;
  List<KontoInformation>? bank;
  List<Umsatz>? umsatze;
  String? userid;
  DocumentReference? documentReference;
  String? geburtsdatum;
  String? anrede;

  Benutzer(
      {required this.vorname,
      required this.nachname,
      required this.email,
      this.bank,
      this.umsatze,
      this.userid,
      this.anrede,
      this.geburtsdatum});

  Map<String, dynamic> toMap() {
    return {
      "vorname": vorname,
      "nachname": nachname,
      "bank": bank?.map((konto) => konto.toMap()).toList(),
      "umsatze": umsatze?.map((umsatz) => umsatz.toMap()).toList(),
      "email": email,
      "userid": userid,
      "geburtsdatum": geburtsdatum,
      "anrede": anrede,
    };
  }

  factory Benutzer.fromMap(
      Map<String, dynamic> map, List<KontoInformation>? kontoInformationen) {
    return Benutzer(
        vorname: map["Vorname"],
        nachname: map["Nachname"],
        email: map["E-mail"],
        bank: kontoInformationen,
        umsatze: List<Umsatz>.from(
            map["Umsatze"].map((umsatz) => Umsatz.fromMap(umsatz))),
        userid: map["userID"],
        geburtsdatum: map["Geburtsdatum"],
        anrede: map["Anrede"]);
  }

  factory Benutzer.fromMap2(Map<String, dynamic> map) {
    return Benutzer(
        vorname: map["vorname"],
        nachname: map["nachname"],
        email: map["email"],
        bank: null,
        umsatze: null,
        
        geburtsdatum: map["geburtsdatum"],
        anrede: map["anrede"]);
  }
}

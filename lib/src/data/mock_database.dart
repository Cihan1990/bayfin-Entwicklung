import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/authentication/domain/name.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';

class MockDatabase implements DatabaseRepository {
// Simulierte Datenbank= Benutzerliste
  List<Benutzer> benutzerliste = [
    Benutzer(
        benutzername: Name(vorname: "Cihan", nachname: "Oezdemir"),
        email: "Cihan.52@hotmail.de",
        telefon: "123123432",
        bank: [
          KontoInformation(
              bank: "Sparkasse",
              bic: "SOLADEST",
              iban: "DE12600501010007283095",
              kontostand: 3530.34),
        ],
        umsatze: [
          Umsatz(betrag: -12.30, umsatzname: "Amazon"),
          Umsatz(betrag: -40.30, umsatzname: "Vodafone"),
          Umsatz(betrag: -56.30, umsatzname: "O2"),
        ],
        userid: "1"),
  ];

  @override
  Future<Benutzer?> getBenutzer(String userid) async {
    await Future.delayed(const Duration(seconds: 2));
    for (var benutzer in benutzerliste) {
      if (benutzer.userid == userid) {
        return benutzer;
      }
    }
    return null;
  }

  @override
  Future<void> addUmsatz(Umsatz neuerUmsatz, String userid) async {
    await Future.delayed(const Duration(seconds: 2));
    // wir suchen den User mit der UserID und fügen den neuen umsatz dem user hinzu
    for (var benutzer in benutzerliste) {
      // wenn user nicht vorhanden, wird kein umsatz hinzugefügt
      if (benutzer.userid == userid) {
        benutzer.umsatze.add(neuerUmsatz);
      }
    }
  }

  @override
  Future<void> addKonto(
      KontoInformation neueKontoInformation, String userid) async {
    await Future.delayed(const Duration(seconds: 2));
    for (var benutzer in benutzerliste) {
      if (benutzer.userid == userid) {
        benutzer.bank.add(neueKontoInformation);
      }
    }
  }

  @override
  Future<void> updateKonto(
      KontoInformation neueKontoInformation, String userid) {
    // TODO: implement updateKonto
    throw UnimplementedError();
  }
  
  @override
  Stream<List<KontoInformation>> getKontoInformation() {
    // TODO: implement getKontoInformation
    throw UnimplementedError();
  }

 
  }


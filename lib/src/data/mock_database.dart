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
              iban: "DE12600501010007283092",
              kontonummer: 7898777,
              kontostand: 123.34),
          KontoInformation(
              bank: "C24",
              bic: "BLABLA",
              iban: "DE12600501010007072343",
              kontonummer: 4343634634,
              kontostand: 43123.34),
        ],
        umsatze: [
          Umsatz(betrag: 12.30, umsatzname: "Amazon"),
        ],
        userid: "1"),
  ];

  @override
  Benutzer? getBenutzer(String userid) {
    for (var benutzer in benutzerliste) {
      if (benutzer.userid == userid) {
        return benutzer;
      }
    }
    return null;
  }

  @override
  void addUmsatz(Umsatz neuerUmsatz, String userid) {
    // wir suchen den User mit der UserID und fügen den neuen umsatz dem user hinzu
    for (var benutzer in benutzerliste) {
      // wenn user nicht vorhanden, wird kein umsatz hinzugefügt
      if (benutzer.userid == userid) {
        benutzer.umsatze.add(neuerUmsatz);
      }
    }
  }
}

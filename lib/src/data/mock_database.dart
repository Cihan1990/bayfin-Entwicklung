import '../features/domain/benutzer.dart';
import '../features/domain/kontoinformationen.dart';
import '../features/domain/name.dart';
import '../features/domain/umsatz.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
// Simulierte Datenbank= Benutzerliste
  List<Benutzer> benutzerliste = [
    Benutzer(
        benutzername: Name(vorname: "Cihan", nachname: "Oezdemir"),
        email: "Cihan.52@hotmail.de",
        telefon: "123123432",
        bank: KontoInformation(
            bank: "Sparkasse",
            bic: "SOLADEST",
            iban: "DE234242342424",
            kontonummer: 7898777,
            kontostand: 123.34),
        umsatze: [Umsatz(betrag: 12.30, umsatzname: "Amazon")],
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

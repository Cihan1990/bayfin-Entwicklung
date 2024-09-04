import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';

class MockDatabase implements DatabaseRepository {
// Simulierte Datenbank= Benutzerliste
  List<Benutzer> benutzerliste = [
    Benutzer(
        vorname: "Cihan",
        nachname: "Oezdemir",
        email: "Cihan.52@hotmail.de",
        bank: [
          KontoInformation(
              bank: "Sparkasse",
              bic: "SOLADEST",
              iban: "DE12600501010007283095",
              kontostand: 3530.34,
              kontotype: "Girokonto"),
        ],
        umsatze: [
          Umsatz(
              betrag: -12.30,
              umsatzname: "Amazon",
              type: false,
              date: DateTime.now().toString()),
          Umsatz(
              betrag: -40.30,
              umsatzname: "Vodafone",
              type: false,
              date: DateTime.now().toString()),
          Umsatz(
              betrag: -56.30,
              umsatzname: "O2",
              type: false,
              date: DateTime.now().toString()),
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
  Future<void> addUmsatz(
      Umsatz neuerUmsatz, String userid, String kontoId) async {
    await Future.delayed(const Duration(seconds: 2));
    // wir suchen den User mit der UserID und fügen den neuen umsatz dem user hinzu
    for (var benutzer in benutzerliste) {
      // wenn user nicht vorhanden, wird kein umsatz hinzugefügt
      if (benutzer.userid == userid) {
        benutzer.umsatze?.add(neuerUmsatz);
      }
    }
  }

  @override
  Future<void> addKonto(
      KontoInformation neueKontoInformation, String userid) async {
    await Future.delayed(const Duration(seconds: 2));
    for (var benutzer in benutzerliste) {
      if (benutzer.userid == userid) {
        benutzer.bank?.add(neueKontoInformation);
      }
    }
  }

  @override
  Future<void> updateKonto(
      KontoInformation neueKontoInformation, String userid) {
    throw UnimplementedError();
  }

  @override
  Stream<List<KontoInformation>> getKontoInformation(String userid) {
    throw UnimplementedError();
  }

  @override
  Future<double> getKontostand(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<KontoInformation> getKontoInfo(String userId, String kontoId) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Umsatz>> getUmsatz(String userid, String kontoId) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteKonto(String iban, String userId) {
    throw UnimplementedError();
  }

  @override
  Future<void> submitRegistrationData(String anrede, String vorname,
      String nachname, String gebDatum, String email, String userId) {
    throw UnimplementedError();
  }

  @override
  Future<Benutzer?> loadUserData(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserData(String userId, Benutzer user) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUserData(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUmsatz(String umsatzname, String userId, String docId) {
    throw UnimplementedError();
  }
}

import 'dart:async';

import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';

abstract class DatabaseRepository {
  Future<Benutzer?> getBenutzer(String userid);

  Future<void> addUmsatz(Umsatz neuerUmsatz, String userid, String kontoId);
  Future<void> addKonto(KontoInformation neueKontoInformation, String userid);
  Future<double> getKontostand(String userId);
  Future<void> updateKonto(
      KontoInformation neueKontoInformation, String userid);
  Future<KontoInformation?> getKontoInfo(String userId, String kontoId);
  Stream<List<KontoInformation>> getKontoInformation(String userId);
  Stream<List<Umsatz>>? getUmsatz(String userId, String kontoId);
  Future<void> deleteKonto(String iban, String userId);
  Future<void> regestraionDataUpload(String anrede, String vorname,
      String nachname, String gebDatum, String email, String userId);
  Future<Benutzer?> loadUserData(String userID);
  Future<void> updateUserData(String userId, Benutzer user);
}

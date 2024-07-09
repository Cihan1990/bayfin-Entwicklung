import 'dart:async';

import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';

abstract class DatabaseRepository {
  Future<Benutzer?> getBenutzer(String userid);

  Future<void> addUmsatz(Umsatz neuerUmsatz, String userid);
  Future<void> addKonto(KontoInformation neueKontoInformation, String userid);
  Future<void> updateKonto(
      KontoInformation neueKontoInformation, String userid);

  Stream<List<KontoInformation>>
      getKontoInformation(); // Dein Stream, der die KontoInformationen liefert

  // TODO: Methode die einen Stream zurückgibt von Kontoinformationen
}

// ignore_for_file: avoid_print

import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/data/mock_database.dart';
import 'package:bayfin/src/features/domain/benutzer.dart';
import 'package:bayfin/src/features/domain/umsatz.dart';

void main() {
  DatabaseRepository databaseRepository = MockDatabase();

  // ignore: unused_local_variable
  Benutzer? benutzerliste = databaseRepository.getBenutzer("1");
  print(benutzerliste!.benutzername.vorname);
  print(benutzerliste.umsatze[0].betrag);
  databaseRepository.addUmsatz(
      Umsatz(betrag: 18.0, umsatzname: "Vodafone"), "1");
  print(benutzerliste.benutzername.vorname);
  print(benutzerliste.umsatze[1].betrag);
}

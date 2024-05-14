import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';

abstract class DatabaseRepository {
  Benutzer? getBenutzer(String userid);

  void addUmsatz(Umsatz neuerUmsatz, String userid);
}

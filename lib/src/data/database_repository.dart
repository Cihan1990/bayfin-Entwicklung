import '../features/Authentication/domain/benutzer.dart';
import '../features/Authentication/domain/umsatz.dart';

abstract class DatabaseRepository {
  Benutzer? getBenutzer(String userid);

  void addUmsatz(Umsatz neuerUmsatz, String userid);
}

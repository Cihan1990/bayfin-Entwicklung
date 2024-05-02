import '../features/domain/benutzer.dart';
import '../features/domain/umsatz.dart';

abstract class DatabaseRepository {
  Benutzer? getBenutzer(String userid);

  void addUmsatz(Umsatz neuerUmsatz, String userid);
}

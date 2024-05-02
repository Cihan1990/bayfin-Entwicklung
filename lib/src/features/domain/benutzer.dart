import 'kontoinformationen.dart';
import 'name.dart';
import 'umsatz.dart';

class Benutzer {
  Name benutzername;
  String email;
  String telefon;
  KontoInformation bank;
  List<Umsatz> umsatze;
  String userid;

  Benutzer({
    required this.benutzername,
    required this.email,
    required this.telefon,
    required this.bank,
    required this.umsatze,
    required this.userid,
  });
}

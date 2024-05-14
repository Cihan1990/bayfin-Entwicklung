import 'package:bayfin/src/features/authentication/domain/name.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';

class Benutzer {
  Name benutzername;
  String email;
  String telefon;
  List<KontoInformation> bank;
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

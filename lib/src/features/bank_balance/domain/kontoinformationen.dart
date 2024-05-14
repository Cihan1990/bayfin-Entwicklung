class KontoInformation {
  String iban;
  String bic;
  int kontonummer;
  String bank;
  double kontostand;

  KontoInformation({
    required this.bank,
    required this.bic,
    required this.iban,
    required this.kontonummer,
    required this.kontostand,
  });
}

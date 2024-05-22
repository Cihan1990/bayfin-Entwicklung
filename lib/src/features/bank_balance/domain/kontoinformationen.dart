class KontoInformation {
  String iban;
  String? bic;

  String bank;
  double? kontostand;

  KontoInformation({
    required this.bank,
    this.bic,
    required this.iban,
    this.kontostand,
  });
}

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
  Map<String, dynamic> toMap() {
    return {
      "bic": bic,
      "iban": iban,
      "bank": bank,
      "kontostand": kontostand,
    };
  }

  factory KontoInformation.fromMap(Map<String, dynamic> map) {
    return KontoInformation(
      bank: map["bank"],
      iban: map["iban"],
      bic: map["bic"],
      kontostand: map["kontostand"]?.toDouble(),
    );
  }
}

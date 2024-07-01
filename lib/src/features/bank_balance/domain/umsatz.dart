class Umsatz {
  double betrag;
  String umsatzname;

  Umsatz({
    required this.betrag,
    required this.umsatzname,
  });

  Map<String, dynamic> toMap() {
    return {
      "betrag": betrag,
      "umsatzname": umsatzname,
    };
  }

  factory Umsatz.fromMap(Map<String, dynamic> map) {
    return Umsatz(
      betrag: map["betrag"],
      umsatzname: map["umsatzname"],
    );
  }
}

class Umsatz {
  double betrag;
  String umsatzname;
  bool type;

  Umsatz({required this.betrag, required this.umsatzname, required this.type});

  Map<String, dynamic> toMap() {
    return {
      "betrag": betrag,
      "name": umsatzname,
      "type": type
    };
  }

  factory Umsatz.fromMap(Map<String, dynamic> map) {
    return Umsatz(
        betrag: map["betrag"].toDouble(),
        umsatzname: map["name"],
        type: map["type"]);
  }
}

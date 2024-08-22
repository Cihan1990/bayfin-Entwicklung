class Umsatz {
  double betrag;
  String umsatzname;
  bool type;
  String date;

  Umsatz(
      {required this.betrag,
      required this.umsatzname,
      required this.type,
      required this.date});

  Map<String, dynamic> toMap() {
    return {"betrag": betrag, "name": umsatzname, "type": type, "date": date};
  }

  factory Umsatz.fromMap(Map<String, dynamic> map) {
    return Umsatz(
        betrag: map["betrag"].toDouble(),
        umsatzname: map["name"],
        type: map["type"],
        date: map["date"]);
  }
}

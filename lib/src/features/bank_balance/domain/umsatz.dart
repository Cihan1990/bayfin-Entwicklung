import 'dart:ffi';

class Umsatz {
  double betrag;
  String umsatzname;
  bool type;

  Umsatz({required this.betrag, required this.umsatzname, required this.type});

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
        type: map["type"]);
  }
}

class Adresse {
  String strasse;
  int houseNumber;
  int plz;
  int etage;
  String ort;

  Adresse({
    required this.strasse,
    required this.houseNumber,
    required this.ort,
    required this.etage,
    required this.plz,
  });

  Map<String, dynamic> toMap() {
    return {
      "strasse": strasse,
      "houseNumber": houseNumber,
      "plz": plz,
      "etage": etage,
      "ort": ort,
    };
  }

  factory Adresse.fromMap(Map<String, dynamic> map) {
    return Adresse(
      strasse: map["strasse"],
      houseNumber: map["houseNumber"],
      plz: map["plz"],
      etage: map["etage"],
      ort: map["ort"],
    );
  }
}

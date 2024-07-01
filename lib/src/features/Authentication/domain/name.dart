class Name {
  String vorname;
  String nachname;

  Name({
    required this.vorname,
    required this.nachname,
  });

  Map<String, dynamic> toMap() {
    return {
      "vorname": vorname,
      "nachname": nachname,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      vorname: map["vorname"],
      nachname: map["nachname"],
    );
  }
}

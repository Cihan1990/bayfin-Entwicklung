String? validatePw(String? input) {
  if (input == null || input.isEmpty) {
    return "Bitte Passwort eingeben";
  }
  if (input.length < 6 || input.length > 12) {
    return "Passwort muss zwischen 6 und maximal 12 Zeichen lang sein";
  }
  return null;
}

bool? validateRepeat(String? pw1, String? pw2) {
  if (pw1 != pw2) {
    return true;
  } else {
    return false;
  }
}

String? validateVn(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte Vorname eingeben';
  }
  return null;
}

String? validateNn(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte Nachname eingeben';
  }
  return null;
}

String? validateGb(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte Geburtsdatum eingeben';
  }
  if (input.split('.').length - 1 != 2) {
    return 'Geburtsdatum muss im Format dd.mm.yyyy sein';
  }
  return null;
}

String? validateEmail(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte E-Mail eingeben';
  }
  if (!input.contains("@")) {
    return 'Email muss das Zeichen "@" enthalten';
  }
  if (!(input.endsWith(".com") || input.endsWith(".de"))) {
    return 'Email muss mit ".com" oder ".de" enden';
  }
  return null;
}

String? validateName(String? input) {
  if (input == null || input.isEmpty) {
    return "Bitte Buntzername/E-Mail Adresse eingeben";
  }
  if (!input.contains("@")) {
    return 'Email muss das Zeichen "@" enthalten';
  }
  if (!(input.endsWith(".com") || input.endsWith(".de"))) {
    return 'Email muss mit ".com" oder ".de" enden';
  }
  return null;
}

String? validateUmsatzbz(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte Umsatzbezeichnung eingeben';
  }
  return null;
}

String? validateUmsatzsumme(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte Umsatzsumme eingeben';
  }
  return null;
}

bool checkIfUmsatzIsMinus(String umsatz) {
  // Überprüfen, ob der String ein Minuszeichen enthält
  if (umsatz.contains('-')) {
    return false;
  } else {
    return true;
  }
}

String? validateIban(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte IBAN eingeben';
  }
  if (input.length != 22) {
    return "IBAN ungültig";
  }
  return null;
}

String? validateBk(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte Bank eingeben';
  }
  return null;
}

String? validateKS(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte Kontostand eingeben';
  }
  double? kontostand = double.tryParse(input);
  if (kontostand == null) {
    return 'Kontostand muss eine Zahl sein';
  }
  return null;
}

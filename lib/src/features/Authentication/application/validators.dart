String? validatePw(String? input) {
  if (input == null || input.isEmpty) {
    return "Bitte Passwort eingeben";
  }
  if (input.length < 6 || input.length > 12) {
    return "Passwort muss zwischen 6 und maximal 12 Zeichen lang sein";
  }
  if (!input.contains(RegExp(r'[A-Z]'))) {
    return "Passwort muss mindestens einen Großbuchstaben enthalten";
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

  final RegExp dateRegex = RegExp(r'^\d{2}\.\d{2}\.\d{4}$');

  if (!dateRegex.hasMatch(input)) {
    return 'Geburtsdatum muss im Format dd.mm.yyyy sein!';
  }

  return null;
}

String? validateEmail(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte E-Mail eingeben';
  }

  // Überprüft, ob die Eingabe eine gültige E-Mail-Adresse ist
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9]+[a-zA-Z0-9._%+-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailRegex.hasMatch(input)) {
    return 'Bitte eine gültige E-Mail-Adresse eingeben';
  }

  // Optional: Weitere Überprüfungen wie .com oder .de
  if (!(input.endsWith(".com") || input.endsWith(".de"))) {
    return 'E-Mail muss mit ".com" oder ".de" enden';
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
  } else if (input.length > 20) {
    return 'Darf max. 20 Zeichen enthalten';
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

  input = input.replaceAll(' ', '');

  if (input.length != 22) {
    return "IBAN ungültig";
  }

  String countryCode = input.substring(0, 2);
  if (!RegExp(r'^[A-Z]{2}$').hasMatch(countryCode)) {
    return "IBAN ungültig";
  }

  String checkDigits = input.substring(2, 4);
  if (!RegExp(r'^\d{2}$').hasMatch(checkDigits)) {
    return "IBAN ungültig";
  }

  String rearranged = input.substring(4) + input.substring(0, 4);

  String numericIban = rearranged.split('').map((char) {
    int numericValue = int.tryParse(char) ?? (char.codeUnitAt(0) - 55);
    return numericValue.toString();
  }).join('');

  BigInt ibanInt = BigInt.parse(numericIban);
  if (ibanInt % BigInt.from(97) != BigInt.one) {
    return "IBAN ungültig";
  }

  return null; // IBAN ist gültig
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

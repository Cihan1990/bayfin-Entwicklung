import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/domain/benutzer.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase implements DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreDatabase(this._firebaseFirestore);

  @override
  Future<Benutzer?> getBenutzer(String userid) async {
    // Benutzer -> userId -> Konto

    final userSnapshot = await _firebaseFirestore
        .collection('Benutzer')
        .doc(userid)
        .collection('Konteninformation')
        .doc()
        .get();
    final userMap = userSnapshot.data();
    if (userMap == null) {
      return null;
    }

    final bankAccountsSnapshot = await _firebaseFirestore
        .collection('Konteninformation')
        .where('userID', isEqualTo: userid)
        .get();
    final bankAccounts = bankAccountsSnapshot.docs
        .map((doc) => KontoInformation.fromMap(doc.data(), doc.reference))
        .toList();

    final user = Benutzer.fromMap(userMap, bankAccounts);

    user.bank = bankAccounts;

    return user;
  }

  @override
  Future<void> addUmsatz(Umsatz neuerUmsatz, String userid, String kontoId) {
    return _firebaseFirestore
        .collection('Benutzer')
        .doc(userid)
        .collection('Konteninformation')
        .doc(kontoId)
        .collection("Umsatz")
        .doc()
        .set(neuerUmsatz.toMap());
  }

  @override
  Future<void> addKonto(
      KontoInformation neueKontoInformation, String userid) async {
    await _firebaseFirestore
        .collection('Benutzer')
        .doc(userid)
        .collection('Konteninformation')
        .add(neueKontoInformation.toMap());
  }

  @override
  Future<void> updateKonto(
      KontoInformation neueKontoInformation, String userid) {
    if (neueKontoInformation.documentReference == null) {
      throw Exception("Kontoinformation braucht eine ID!");
    }

    return _firebaseFirestore
        .collection('Benutzer')
        .doc(userid)
        .collection('Konteninformation')
        .doc(neueKontoInformation.documentReference!.id)
        .update(neueKontoInformation.toMap());
  }

  @override
  Stream<List<KontoInformation>> getKontoInformation(String userId) {
    return _firebaseFirestore
        .collection('Benutzer')
        .doc(userId)
        .collection("Konteninformation")
        .snapshots()
        .map((snapshot) {
      return (snapshot.docs)
          .map((doc) => KontoInformation.fromMap(doc.data(), doc.reference))
          .toList();
    });
  }

  @override
  Future<double> getKontostand(String userId) async {
    final docs = await _firebaseFirestore
        .collection('Benutzer')
        .doc(userId)
        .collection("Konteninformation")
        .get();

    List<KontoInformation> konten = [];

    for (DocumentSnapshot doc in docs.docs) {
      final konto = KontoInformation.fromMap(
          doc.data() as Map<String, dynamic>, doc.reference);

      konten.add(konto);
    }

    return konten.fold<double>(0, (p, c) => p + (c.kontostand ?? 0.0));
  }

  @override
  Future<KontoInformation?> getKontoInfo(String userId, String kontoId) async {
    final kontoInfo = await _firebaseFirestore
        .collection('Benutzer')
        .doc(userId)
        .collection("Konteninformation")
        .doc(kontoId)
        .get();

    return KontoInformation.fromMap(kontoInfo.data()!, kontoInfo.reference);
  }

  @override
  Stream<List<Umsatz>>? getUmsatz(String userId, String kontoId) {
    return _firebaseFirestore
        .collection('Benutzer')
        .doc(userId)
        .collection("Konteninformation")
        .doc(kontoId)
        .collection('Umsatz')
        .snapshots()
        .map((snapshot) {
      return (snapshot.docs).map((doc) {
        print("Getting doc: ${doc.data()}");
        try {
          return Umsatz.fromMap(doc.data());
        } catch (e) {
          throw Exception(e);
        }
      }).toList();
    });
  }

  @override
  Future<void> deleteKonto(String iban, String userId) async {
    try {
      final querySnapshot = await _firebaseFirestore
          .collection('Benutzer')
          .doc(userId)
          .collection('Konteninformation')
          .where('iban', isEqualTo: iban)
          .get();

      for (final doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print('Fehler beim Löschen des Kontos: $e');
    }
  }

  @override
  Future<void> regestraionDataUpload(String anrede, String vorname,
      String nachname, String gebDatum, String email, String userId) async {
    final result = _firebaseFirestore.collection("Benutzer").doc(userId).set({
      "userID": userId,
      "anrede": anrede,
      "vorname": vorname,
      "nachname": nachname,
      "geburtsdatum": gebDatum,
      "email": email,
    });
  }

  @override
  Future<Benutzer?> loadUserData(String userId) async {
    try {
      final snapshot =
          await _firebaseFirestore.collection("Benutzer").doc(userId).get();
      if (!snapshot.exists) {
        return null;
      }

      return Benutzer.fromMap2(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print("Error: {$e}");
      //// Debug-Ausgabe
      return null;
    }
  }

  @override
  Future<void> updateUserData(String userId, Benutzer user) async {
    try {
      await _firebaseFirestore.collection('Benutzer').doc(userId).update({
        'vorname': user.vorname,
        'nachname': user.nachname,
        'geburtsdatum': user.geburtsdatum,
        'email': user.email,
        'anrede': user.anrede,
      });
    } catch (e) {
      throw Exception('Fehler bei der Änderung der Daten!');
    }
  }

  @override
  Future<void> deleteUserData(String userId) async {
    try {
      final querySnapshot = await _firebaseFirestore
          .collection('Benutzer')
          .doc(userId)
          .collection('Konteninformation')
          .get();

      for (final doc in querySnapshot.docs) {
        await doc.reference.delete();
      }

      await _firebaseFirestore.collection('Benutzer').doc(userId).delete();
    } catch (e) {
      throw Exception('Fehler beim Löschen der Daten!');
    }
  }
  
}

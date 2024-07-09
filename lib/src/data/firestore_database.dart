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

    // Get user data
    final user = Benutzer.fromMap(userMap);

    // Get bank accounts for the user (assuming a 'userId' field in bank_accounts)
    final bankAccountsSnapshot = await _firebaseFirestore
        .collection('Konteninformation')
        .where('userId', isEqualTo: userid)
        .get();
    final bankAccounts = bankAccountsSnapshot.docs
        .map((doc) => KontoInformation.fromMap(doc.data()))
        .toList();

    // Set bank accounts on the user object
    user.bank = bankAccounts;

    return user;
  }

  @override
  Future<void> addUmsatz(Umsatz neuerUmsatz, String userid) {
    return _firebaseFirestore
        .collection('Umsatz')
        .doc(neuerUmsatz.umsatzname)
        .update(neuerUmsatz.toMap());
  }

  @override
  Future<void> addKonto(
      KontoInformation neueKontoInformation, String userid) async {
    await  _firebaseFirestore.collection('Konteninformation').add(neueKontoInformation.toMap());
  }

  @override
  Future<void> updateKonto(
      KontoInformation neueKontoInformation, String userid) {
    if (neueKontoInformation.documentReference == null) {
      throw Exception("Kontoinformation braucht eine ID!");
    }
    return _firebaseFirestore
        .collection('Konteninformation')
        .doc(neueKontoInformation.documentReference.toString())
        .update(neueKontoInformation.toMap());
  }

 Stream<List<KontoInformation>> getKontoInformation() {
  return _firebaseFirestore
      .collection('Konteninformation')
      .snapshots()
      .map((snapshot) {
        return snapshot.docs
            .map((doc) => KontoInformation.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
      });
}

  /// TODO: Methiode mit Future, die ein Dokument pber eine Id zurückgibvt

  @override
  Future<KontoInformation?> getKontoInfo(Benutzer userID) {
    // TODO: implement getKontoInfo
    throw UnimplementedError();
  }
}

  // TODO: Methode hier implemenntieren


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
    final snapshot =
        await _firebaseFirestore.collection('Benutzer').doc(userid).get();
    final map = snapshot.data();
    if (map == null) {
      return null;
    } else {
      return Benutzer.fromMap(map);
    }
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
    return _firebaseFirestore.collection('Kontoinformation').doc(userid).set(
          neueKontoInformation.toMap(),
        );
    // final map = snapshot.data();
    // if (map == null) {
    // return;
    // } else {
    // return KontoInformation.fromMap(map);
    // }
  }
  
  @override
  Future<void> updateKonto(KontoInformation neueKontoInformation, String userid) {
 return _firebaseFirestore.collection('Kontoinformation').doc(userid).update(
          neueKontoInformation.toMap(),
        );
  }
}

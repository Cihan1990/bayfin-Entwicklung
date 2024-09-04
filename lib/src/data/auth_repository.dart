/* 
  X Zugriff auf User (UID, Email, DisplayName, PhotoURL)
  X Registierung
  X Login
  X Logout
  X AuthStateChanges
  
   */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  // Attribute
  final FirebaseAuth _firebaseAuth;

  // Konstruktor
  AuthRepository(this._firebaseAuth);

  // Methoden

  /// returns the currently logged in [User]
  /// or `null` if no User is logged in
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  String getUserId() {
    return _firebaseAuth.currentUser?.uid ?? "";
  }

  Future<void> signUpWithEmailAndPassword(String email, String pw) {
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pw);
  }

  Future<void> loginWithEmailAndPassword(String email, String pw) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: pw);
  }

  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  Future<void> resetPassword(String email) {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  Future<void> deleteAccount(String userId) async {
    try {
      // Löscht den aktuell angemeldeten Benutzer
      await _firebaseAuth.currentUser?.delete();
    } catch (e) {
      // Hier kannst du eventuell Fehler-Handling hinzufügen
      debugPrint('Fehler beim Löschen des Accounts: $e');
      rethrow;
    }
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log('Failed with error code: ${e.code}');
      log(e.message.toString());
      throw Exception(e);
    }
  }

  Future<void> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log('Failed with error code: ${e.code}');
      log(e.message.toString());
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> sendRecoveryEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signInWithCredentials(AuthCredential credential) async {
    try {
      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> changeDisplayName(String displayName) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(displayName);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> changeEmail(String email) async {
    try {
      await _firebaseAuth.currentUser?.updateEmail(email);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> changePassword(String password) async {
    try {
      await _firebaseAuth.currentUser?.updatePassword(password);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> changeProfilePhoto(String url) async {
    try {
      await _firebaseAuth.currentUser?.updatePhotoURL(url);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw Exception(e);
    }
  }

}

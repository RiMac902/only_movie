import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:only_movie/core/error/exceptions.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/firebase_auth_data_source.dart';
import '../data_sources/firebase_storage_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource _authService;
  final FirebaseStorageDataSource _storageService;

  AuthRepositoryImpl(this._authService, this._storageService);

  @override
  Future<Either<Failure, void>> changeDisplayName(String displayName) async {
    try {
      final result = await _authService.changeDisplayName(displayName);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changeEmail(String email) async {
    try {
      final result = _authService.changeEmail(email);

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(String password) async {
    try {
      final result = _authService.changePassword(password);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = _authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  User? getCurrentUser() {
    return _authService.currentUser;
  }

  @override
  bool isLoggedIn() {
    return _authService.currentUser != null;
  }

  @override
  Future<Either<Failure, void>> saveProfilePhoto(File photo) async {
    try {
      final downloadUrl = await _storageService.uploadProfilePhoto(
        photo,
        _authService.currentUser!,
      );

      final result = _authService.changeProfilePhoto(downloadUrl);

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendRecoveryEmail(String email) async {
    try {
      final result = _authService.sendRecoveryEmail(email: email);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendVerifyEmail() async {
    try {
      final result = _authService.sendVerificationEmail();
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final result = _authService.signOut();
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<Either<Failure, void>> signInWithApple() async {
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);

    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final result = _authService.signInWithCredentials(oauthCredential);

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(
        loginResult.accessToken!.token,
      );

      final result = _authService.signInWithCredentials(facebookAuthCredential);

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final result = _authService.signInWithCredentials(credential);

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

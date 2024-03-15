import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signInWithEmailAndPassword(String email, String password);

  Future<Either<Failure, void>> createUserWithEmailAndPassword(String email, String password);

  Future<Either<Failure, void>> signOut();

  bool isLoggedIn();

  User? getCurrentUser();

  Future<Either<Failure, void>> sendRecoveryEmail(String email);

  Future<Either<Failure, void>> signInWithGoogle();

  Future<Either<Failure, void>> signInWithFacebook();

  Future<Either<Failure, void>> signInWithApple();

  Future<Either<Failure, void>> changeDisplayName(String displayName);

  Future<Either<Failure, void>> changePassword(String password);

  Future<Either<Failure, void>> changeEmail(String email);

  Future<Either<Failure, void>> sendVerifyEmail();

  Future<Either<Failure, void>> saveProfilePhoto(File photo);
}
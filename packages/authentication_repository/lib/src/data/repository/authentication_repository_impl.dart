import 'dart:convert';

import 'package:authentication_repository/src/data/data.dart';
import 'package:authentication_repository/src/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/src/failures/login_failure.dart';
import 'package:errors/src/failures/logout_failure.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:storage_repository/storage_repository.dart';

/// {@template authentication_repository_impl}
/// Implementation of AuthenticationRepository
/// {@endtemplate}
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  /// {@macro authentication_repository_impl}
  AuthenticationRepositoryImpl({
    required StorageRepository storage,
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    FacebookAuth? facebookAuth,
  })  : _storage = storage,
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _facebookAuth = facebookAuth ?? FacebookAuth.instance;

  final StorageRepository _storage;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  /// Whether or not the current environment is web
  /// Should only be overriden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  @override
  Future<Either<LoginFailure, Success>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(Success.instance);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return left(LoginFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(LoginFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<LoginFailure, Success>> logInWithFacebook() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final facebookProvider = firebase_auth.FacebookAuthProvider();
        final userCredential =
            await _firebaseAuth.signInWithPopup(facebookProvider);
        credential = userCredential.credential!;
      } else {
        final facebookUser = await _facebookAuth.login();
        final facebookAuthCredential =
            firebase_auth.FacebookAuthProvider.credential(
          facebookUser.accessToken!.token,
        );
        credential = facebookAuthCredential;
      }
      await _firebaseAuth.signInWithCredential(credential);
      return right(Success.instance);
    } catch (e) {
      return left(LoginFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<LoginFailure, Success>> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }
      await _firebaseAuth.signInWithCredential(credential);
      return right(Success.instance);
    } catch (e) {
      return left(LoginFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<LogoutFailure, Success>> logout() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
        _facebookAuth.logOut(),
      ]);
      return right(Success.instance);
    } catch (e) {
      return left(LogoutFailure(errorMessage: e.toString()));
    }
  }

  @override
  Stream<UserEntity> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user =
          firebaseUser == null ? UserEntity.empty : firebaseUser.toUser;
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [UserEntity.empty] if there is no cached user.
  Future<UserEntity> currentUser(String storageKey) async {
    final userString = await _storage.read(key: storageKey);
    if (userString == null) return UserEntity.empty;
    final userMap = json.decode(userString) as Map<String, dynamic>;
    return UserModel.fromJson(userMap);
  }
}

extension on firebase_auth.User {
  UserEntity get toUser {
    return UserEntity(
      id: uid,
      email: email ?? '',
      username: displayName ?? '',
    );
  }
}

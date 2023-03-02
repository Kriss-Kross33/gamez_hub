import 'package:authentication_repository/src/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

/// {@template authentication_repository}
/// Authenticate
/// {@endtemplate}
abstract class AuthenticationRepository {
  /// Logs a user in with a provided [email] and [password]
  ///
  /// Returns a [LoginFailure] when an error occurs
  Future<Either<LoginFailure, Success>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Logs a user in with a google account
  ///
  /// Returns a [LoginFailure] when an error occurs
  Future<Either<LoginFailure, Success>> logInWithGoogle();

  /// Logs a user in with a facebook account
  ///
  /// Returns a [LoginFailure] when an error occurs
  Future<Either<LoginFailure, Success>> logInWithFacebook();

  /// Logs out the user
  ///
  /// Returns [LogoutFailure] when an error occurs
  Future<Either<LogoutFailure, Success>> logout();

  /// Stream of [UserEntity] which emits the current user when
  /// the authentication state changes.
  ///
  /// Emits [UserEntity.empty] when user is unauthenticated.
  Stream<UserEntity> get user;
}

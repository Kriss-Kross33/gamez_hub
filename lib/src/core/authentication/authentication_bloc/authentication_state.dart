part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    required this.status,
    this.user = UserEntity.empty,
  });

  AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  AuthenticationState.authenticated({required UserEntity user})
      : this._(status: AuthenticationStatus.authenticated, user: user);

  final UserEntity user;
  final AuthenticationStatus status;

  @override
  List<Object> get props => [user, status];
}

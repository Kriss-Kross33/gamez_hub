part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserChangedEvent extends AuthenticationEvent {
  AuthenticationUserChangedEvent({required this.user});

  final UserEntity user;

  @override
  List<Object> get props => [user];
}

class LogoutTriggeredEvent extends AuthenticationEvent {}

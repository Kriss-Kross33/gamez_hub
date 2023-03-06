import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gamez_hub/src/core/authentication/entities/entities.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(AuthenticationState.unauthenticated()) {
    on<AuthenticationUserChangedEvent>(_onAuthenticationUserChangedEvent);
    on<LogoutTriggeredEvent>(_onLogoutTriggeredEvent);
    _userSubscription = authenticationRepository.user.listen((user) {
      add(AuthenticationUserChangedEvent(user: user));
    });
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<UserEntity> _userSubscription;

  @override
  Future<void> close() async {
    _userSubscription.cancel();
    super.close();
  }

  Future<void> _onAuthenticationUserChangedEvent(
      AuthenticationUserChangedEvent event,
      Emitter<AuthenticationState> emit) async {
    emit(event.user != UserEntity.empty
        ? AuthenticationState.authenticated(user: event.user)
        : AuthenticationState.unauthenticated());
  }

  Future<void> _onLogoutTriggeredEvent(
      LogoutTriggeredEvent event, Emitter<AuthenticationState> emit) async {
    unawaited(_authenticationRepository.logout());
  }
}

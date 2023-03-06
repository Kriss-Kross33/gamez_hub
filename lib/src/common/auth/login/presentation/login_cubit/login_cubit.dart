import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(LoginState());

  final AuthenticationRepository _authenticationRepository;

  void onEmailChanged(String emailString) {
    final email = Email.dirty(emailString);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
          [
            email,
            state.password,
          ],
        ),
      ),
    );
  }

  void onPasswordChanged(String passwordString) {
    final password = Password.dirty(passwordString);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(
          [
            state.email,
            password,
          ],
        ),
      ),
    );
  }

  void onLoginButtonPressed() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final _eitherFailureOrSuccessfulLogin =
        await _authenticationRepository.logInWithEmailAndPassword(
      email: state.email.value,
      password: state.password.value,
    );
    _eitherFailureOrSuccessfulLogin.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: failure.errorMessage,
        ),
      ),
      (success) => {
        emit(
          state.copyWith(status: FormzStatus.submissionSuccess),
        )
      },
    );
  }
}

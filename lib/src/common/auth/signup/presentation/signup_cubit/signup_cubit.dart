import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(SignupState());

  final AuthenticationRepository _authenticationRepository;

  void onFirstNameChanged(String firstNameString) {
    final firstName = Name.dirty(firstNameString);
    emit(
      state.copyWith(
        firstName: firstName,
        status: Formz.validate(
          [
            state.email,
            state.password,
            state.confirmPassword,
            firstName,
            state.lastName,
            state.username,
          ],
        ),
      ),
    );
  }

  void onLastNameChanged(String lastNameString) {
    final lastName = Name.dirty(lastNameString);
    emit(
      state.copyWith(
        lastName: lastName,
        status: Formz.validate(
          [
            state.email,
            state.password,
            state.confirmPassword,
            state.firstName,
            lastName,
            state.username,
          ],
        ),
      ),
    );
  }

  void onUsernameChanged(String usernameString) {
    final username = Field.dirty(usernameString);
    emit(
      state.copyWith(
        username: username,
        status: Formz.validate(
          [
            state.email,
            state.password,
            state.confirmPassword,
            state.firstName,
            state.lastName,
            username,
          ],
        ),
      ),
    );
  }

  void onEmailChanged(String emailString) {
    final email = Email.dirty(emailString);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
          [
            email,
            state.password,
            state.confirmPassword,
            state.firstName,
            state.lastName,
            state.username,
          ],
        ),
      ),
    );
  }

  void onPasswordChanged(String passwordString) {
    final password = Password.dirty(passwordString);
    final confirmPassword = ConfirmPassword.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmPassword: confirmPassword,
        status: Formz.validate(
          [
            state.email,
            state.firstName,
            state.lastName,
            state.username,
            password,
            confirmPassword,
          ],
        ),
      ),
    );
  }

  void onConfirmPasswordChanged(String confirmPasswordString) {
    final confirmPassword = ConfirmPassword.dirty(
      value: confirmPasswordString,
      password: state.password.value,
    );
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        status: Formz.validate(
          [
            state.email,
            state.password,
            confirmPassword,
            state.firstName,
            state.lastName,
            state.username,
          ],
        ),
      ),
    );
  }

  void onLoginButtonPressed() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final _eitherFailureOrSuccessfulLogin =
        await _authenticationRepository.signup(
      SignupEntity(
        email: state.email.value,
        password: state.password.value,
        username: state.username.value,
        firstName: state.firstName.value,
        lastName: state.lastName.value,
      ),
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

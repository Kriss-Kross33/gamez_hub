part of 'signup_cubit.dart';

class SignupState extends Equatable {
  const SignupState({
    this.firstName = const Name.pure(),
    this.lastName = const Name.pure(),
    this.username = const Field.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final Name firstName;
  final Name lastName;
  final Field username;
  final ConfirmPassword confirmPassword;
  final FormzStatus status;
  final String? errorMessage;

  SignupState copyWith({
    Name? firstName,
    Name? lastName,
    Field? username,
    Email? email,
    Password? password,
    ConfirmPassword? confirmPassword,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return SignupState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        firstName,
        lastName,
        username,
        email,
        password,
        confirmPassword,
        status,
      ];
}

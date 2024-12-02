part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const InputText.pure(),
    this.password = const InputText.pure(),
    this.errorMessage,
  });

  final FormzStatus status;
  final InputText email;
  final InputText password;
  final String? errorMessage;

  LoginState copyWith({
    FormzStatus? status,
    InputText? email,
    InputText? password,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, email, password];
}

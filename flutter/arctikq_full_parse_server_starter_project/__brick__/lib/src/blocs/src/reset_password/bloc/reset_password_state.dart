// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  final FormzStatus status;
  final InputText email;
  final String? errorMessage;

  ResetPasswordState({
    this.status = FormzStatus.pure,
    this.email = const InputText.pure(),
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        email,
        errorMessage,
      ];

  ResetPasswordState copyWith({
    FormzStatus? status,
    InputText? email,
    String? errorMessage,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

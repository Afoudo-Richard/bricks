part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();
  @override
  List<Object> get props => [];
}

class ResetPasswordChanged extends ResetPasswordEvent {}

class ResetPassowrdEmailChanged extends ResetPasswordEvent {
  const ResetPassowrdEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class ResetPasswordSubmitted extends ResetPasswordEvent {}

class SubmitResetPasswordInputsChecked extends ResetPasswordEvent {}

part of 'otp_check_bloc.dart';

abstract class OtpCheckEvent extends Equatable {
  const OtpCheckEvent();
  @override
  List<Object> get props => [];
}

class OtpCheckUserTokenChanged extends OtpCheckEvent {
  const OtpCheckUserTokenChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class OtpCheckCode1Changed extends OtpCheckEvent {
  const OtpCheckCode1Changed(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class OtpCheckCode2Changed extends OtpCheckEvent {
  const OtpCheckCode2Changed(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class OtpCheckCode3Changed extends OtpCheckEvent {
  const OtpCheckCode3Changed(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class OtpCheckCode4Changed extends OtpCheckEvent {
  const OtpCheckCode4Changed(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class OtpCheckCode5Changed extends OtpCheckEvent {
  const OtpCheckCode5Changed(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class OtpCheckCode6Changed extends OtpCheckEvent {
  const OtpCheckCode6Changed(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class OtpCheckResendStatusResetted extends OtpCheckEvent {}

class OtpCheckFormStatusResetted extends OtpCheckEvent {}

class OtpCheckSubmitted extends OtpCheckEvent {
  final bool isTest;
  OtpCheckSubmitted({this.isTest = false});
}

class OtpCheckResendCodeSubmitted extends OtpCheckEvent {}

class OtpCheckInputsChecked extends OtpCheckEvent {}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'otp_check_bloc.dart';

enum ResendCodeSubmittedStatus { initial, loading, success, failure }

class OtpCheckState extends Equatable {
  final FormzStatus formStatus;
  final InputText code1;
  final InputText code2;
  final InputText code3;
  final InputText code4;
  final InputText code5;
  final InputText code6;
  final String? errorMessage;
  final bool disableSend;
  final String? userToken;
  final ResendCodeSubmittedStatus resendCodeSubmittedStatus;

  const OtpCheckState({
    this.formStatus = FormzStatus.pure,
    this.code1 = const InputText.pure(),
    this.code2 = const InputText.pure(),
    this.code3 = const InputText.pure(),
    this.code4 = const InputText.pure(),
    this.code5 = const InputText.pure(),
    this.code6 = const InputText.pure(),
    this.errorMessage,
    this.disableSend = false,
    this.userToken,
    this.resendCodeSubmittedStatus = ResendCodeSubmittedStatus.initial,
  });

  @override
  List<Object?> get props => [
        formStatus,
        code1,
        code2,
        code3,
        code4,
        code5,
        code6,
        errorMessage,
        disableSend,
        userToken,
        resendCodeSubmittedStatus,
      ];

  OtpCheckState copyWith({
    FormzStatus? formStatus,
    InputText? code1,
    InputText? code2,
    InputText? code3,
    InputText? code4,
    InputText? code5,
    InputText? code6,
    String? errorMessage,
    bool? disableSend,
    String? userToken,
    ResendCodeSubmittedStatus? resendCodeSubmittedStatus,
  }) {
    return OtpCheckState(
      formStatus: formStatus ?? this.formStatus,
      code1: code1 ?? this.code1,
      code2: code2 ?? this.code2,
      code3: code3 ?? this.code3,
      code4: code4 ?? this.code4,
      code5: code5 ?? this.code5,
      code6: code6 ?? this.code6,
      errorMessage: errorMessage ?? this.errorMessage,
      disableSend: disableSend ?? this.disableSend,
      userToken: userToken ?? this.userToken,
      resendCodeSubmittedStatus:
          resendCodeSubmittedStatus ?? this.resendCodeSubmittedStatus,
    );
  }
}

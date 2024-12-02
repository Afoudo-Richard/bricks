import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

part 'otp_check_event.dart';
part 'otp_check_state.dart';

class OtpCheckBloc extends Bloc<OtpCheckEvent, OtpCheckState> {
  OtpCheckBloc({
    required this.phone,
    // required this.authToken,
  }) : super(OtpCheckState()) {
    on<OtpCheckCode1Changed>(_onOtpCheckCode1Changed);
    on<OtpCheckCode2Changed>(_onOtpCheckCode2Changed);
    on<OtpCheckCode3Changed>(_onOtpCheckCode3Changed);
    on<OtpCheckCode4Changed>(_onOtpCheckCode4Changed);
    on<OtpCheckCode5Changed>(_onOtpCheckCode5Changed);
    on<OtpCheckCode6Changed>(_onOtpCheckCode6Changed);
    on<OtpCheckInputsChecked>(_onOtpCheckInputsChecked);
    on<OtpCheckSubmitted>(_onOtpCheckSubmitted);
    on<OtpCheckResendCodeSubmitted>(_onOtpCheckResendCodeSubmitted);
    on<OtpCheckUserTokenChanged>(_onOtpCheckUserTokenChanged);
    on<OtpCheckResendStatusResetted>(_onOtpCheckResendStatusResetted);
    on<OtpCheckFormStatusResetted>(_onOtpCheckFormStatusResetted);
  }

  final String phone;
  // final String authToken;

  Future<void> _onOtpCheckFormStatusResetted(
    OtpCheckFormStatusResetted event,
    Emitter<OtpCheckState> emit,
  ) async {
    emit(state.copyWith(
      formStatus: FormzStatus.submissionCanceled,
    ));
  }

  Future<void> _onOtpCheckResendStatusResetted(
    OtpCheckResendStatusResetted event,
    Emitter<OtpCheckState> emit,
  ) async {
    emit(state.copyWith(
      resendCodeSubmittedStatus: ResendCodeSubmittedStatus.initial,
    ));
  }

  Future<void> _onOtpCheckUserTokenChanged(
    OtpCheckUserTokenChanged event,
    Emitter<OtpCheckState> emit,
  ) async {
    emit(state.copyWith(
      userToken: event.value,
    ));
  }

  Future<void> _onOtpCheckCode1Changed(
    OtpCheckCode1Changed event,
    Emitter<OtpCheckState> emit,
  ) async {
    final code1 =
        InputText.dirty(event.value, listOfNumberValidators(event.value));
    emit(state.copyWith(
      code1: code1,
      formStatus: Formz.validate([
        code1,
        state.code2,
        state.code3,
        state.code4,
        state.code5,
        state.code6,
      ]),
    ));
  }

  Future<void> _onOtpCheckCode2Changed(
    OtpCheckCode2Changed event,
    Emitter<OtpCheckState> emit,
  ) async {
    final code2 =
        InputText.dirty(event.value, listOfNumberValidators(event.value));
    emit(state.copyWith(
      code2: code2,
      formStatus: Formz.validate([
        state.code1,
        code2,
        state.code3,
        state.code4,
        state.code5,
        state.code6,
      ]),
    ));
  }

  Future<void> _onOtpCheckCode3Changed(
    OtpCheckCode3Changed event,
    Emitter<OtpCheckState> emit,
  ) async {
    final code3 =
        InputText.dirty(event.value, listOfNumberValidators(event.value));
    emit(state.copyWith(
      code3: code3,
      formStatus: Formz.validate([
        state.code1,
        state.code2,
        code3,
        state.code4,
        state.code5,
        state.code6,
      ]),
    ));
  }

  Future<void> _onOtpCheckCode4Changed(
    OtpCheckCode4Changed event,
    Emitter<OtpCheckState> emit,
  ) async {
    final code4 =
        InputText.dirty(event.value, listOfNumberValidators(event.value));
    emit(state.copyWith(
      code4: code4,
      formStatus: Formz.validate([
        state.code1,
        state.code2,
        state.code3,
        code4,
        state.code5,
        state.code6,
      ]),
    ));
  }

  Future<void> _onOtpCheckCode5Changed(
    OtpCheckCode5Changed event,
    Emitter<OtpCheckState> emit,
  ) async {
    final code5 =
        InputText.dirty(event.value, listOfNumberValidators(event.value));
    emit(state.copyWith(
      code5: code5,
      formStatus: Formz.validate([
        state.code1,
        state.code2,
        state.code3,
        state.code4,
        code5,
        state.code6,
      ]),
    ));
  }

  Future<void> _onOtpCheckCode6Changed(
    OtpCheckCode6Changed event,
    Emitter<OtpCheckState> emit,
  ) async {
    final code6 =
        InputText.dirty(event.value, listOfNumberValidators(event.value));
    emit(state.copyWith(
      code6: code6,
      formStatus: Formz.validate([
        state.code1,
        state.code2,
        state.code3,
        state.code4,
        state.code5,
        code6,
      ]),
    ));
  }

  Future<void> _onOtpCheckInputsChecked(
    OtpCheckInputsChecked event,
    Emitter<OtpCheckState> emit,
  ) async {
    emit(state.copyWith(
      code1: InputText.dirty(
          state.code1.value, listOfNumberValidators(state.code1.value)),
      code2: InputText.dirty(
          state.code2.value, listOfNumberValidators(state.code2.value)),
      code3: InputText.dirty(
          state.code3.value, listOfNumberValidators(state.code3.value)),
      code4: InputText.dirty(
          state.code4.value, listOfNumberValidators(state.code4.value)),
      code5: InputText.dirty(
          state.code4.value, listOfNumberValidators(state.code5.value)),
      code6: InputText.dirty(
          state.code4.value, listOfNumberValidators(state.code6.value)),
    ));
  }

  void _onOtpCheckSubmitted(
    OtpCheckSubmitted event,
    Emitter<OtpCheckState> emit,
  ) async {
    if (state.formStatus.isValidated) {
      emit(state.copyWith(formStatus: FormzStatus.submissionInProgress));
      try {
        // Map response = await entechxisEventsAppApi.checkActivationCode(
        //   code:
        //       "${state.code1.value}${state.code2.value}${state.code3.value}${state.code4.value}${state.code5.value}${state.code6.value}",
        //   phone: phone,
        //   // userToken: authToken,
        // );
        // final authToken = response['data']['token'];
        if (event.isTest) {
          if ("${state.code1.value}${state.code2.value}${state.code3.value}${state.code4.value}${state.code5.value}${state.code6.value}" ==
              "123456") {
            emit(state.copyWith(
              formStatus: FormzStatus.submissionSuccess,
            ));
          } else {
            emit(
              state.copyWith(
                errorMessage: "Incorrect OTP. Please try again",
                formStatus: FormzStatus.submissionFailure,
              ),
            );
          }
        } else {
          final otp = await _getOtpCode(
            password:
                "${state.code1.value}${state.code2.value}${state.code3.value}${state.code4.value}${state.code5.value}${state.code6.value}",
            phone: phone,
          );

          print(otp?.phone);

          if (otp != null) {
            if (DateTime.now().compareTo(otp.expiringDate!) < 0) {
              emit(state.copyWith(
                formStatus: FormzStatus.submissionSuccess,
              ));
            } else {
              emit(
                state.copyWith(
                  errorMessage: "OTP has expired. Please try again",
                  formStatus: FormzStatus.submissionFailure,
                ),
              );
            }
          } else {
            emit(
              state.copyWith(
                errorMessage: "Incorrect OTP. Please try again",
                formStatus: FormzStatus.submissionFailure,
              ),
            );
          }
        }
      } on ErrorResponse catch (e) {
        emit(
          state.copyWith(
            errorMessage: e.getErrorsAsString ?? e.message,
            formStatus: FormzStatus.submissionFailure,
          ),
        );
      } catch (_) {
        emit(
          state.copyWith(formStatus: FormzStatus.submissionFailure),
        );
      }
    }
  }

  void _onOtpCheckResendCodeSubmitted(
    OtpCheckResendCodeSubmitted event,
    Emitter<OtpCheckState> emit,
  ) async {
    emit(
      state.copyWith(
        resendCodeSubmittedStatus: ResendCodeSubmittedStatus.loading,
      ),
    );
    try {
      final ParseCloudFunction function = ParseCloudFunction("resendOtp");

      final Map<String, dynamic> params = <String, dynamic>{
        'phone': phone,
      };
      final ParseResponse parseResponse =
          await function.executeObjectFunction<ParseObject>(parameters: params);

      if (parseResponse.success && parseResponse.result != null) {
        debugPrint(parseResponse.result.toString());
      }

      emit(
        state.copyWith(
          resendCodeSubmittedStatus: ResendCodeSubmittedStatus.success,
        ),
      );
    } on ErrorResponse catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.getErrorsAsString ?? e.message,
          resendCodeSubmittedStatus: ResendCodeSubmittedStatus.failure,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        resendCodeSubmittedStatus: ResendCodeSubmittedStatus.failure,
      ));
    }
  }

  Future<Otp?> _getOtpCode({
    required String password,
    required String phone,
  }) async {
    QueryBuilder<Otp> query = QueryBuilder(Otp())
      ..whereEqualTo("password", password);
    // ..whereEqualTo("phone", phone);

    // query.whereStartsWith("phone", phone);

    return query.first();
  }
}

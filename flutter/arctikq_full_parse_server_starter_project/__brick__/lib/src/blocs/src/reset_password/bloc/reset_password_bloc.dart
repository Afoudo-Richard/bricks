import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordState()) {
    on<ResetPassowrdEmailChanged>(_onResetPassowrdEmailChanged);
    on<SubmitResetPasswordInputsChecked>(_onSubmitResetPasswordInputsChecked);
    on<ResetPasswordSubmitted>(_onResetPasswordSubmitted);
  }

  Future<void> _onResetPassowrdEmailChanged(
    ResetPassowrdEmailChanged event,
    Emitter<ResetPasswordState> emit,
  ) async {
    final email = InputText.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
      ]),
    ));
  }

  Future<void> _onSubmitResetPasswordInputsChecked(
    SubmitResetPasswordInputsChecked event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(state.copyWith(
      email: InputText.dirty(state.email.value),
    ));
  }

  void _onResetPasswordSubmitted(
    ResetPasswordSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final ParseUser user = ParseUser(null, null, state.email.value.trim());
        final ParseResponse parseResponse = await user.requestPasswordReset();
        if (parseResponse.success) {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        } else {
          emit(state.copyWith(
              errorMessage: parseResponse.error!.message,
              status: FormzStatus.submissionFailure));
        }
      } catch (e) {
        emit(state.copyWith(
          errorMessage: e.toString(),
          status: FormzStatus.submissionFailure,
        ));
      }
    }
  }
}

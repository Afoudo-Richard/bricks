import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';

part 'otp_count_down_check_event.dart';
part 'otp_count_down_check_state.dart';

class OtpCountDownCheckBloc
    extends Bloc<OtpCountDownCheckEvent, OtpCountDownCheckState> {
  OtpCountDownCheckBloc() : super(const OtpCountDownCheckState()) {
    on<OtpCountDownCheckIsRunningChanged>(_onOtpCountDownCheckIsRunningChanged);
    on<OtpCountDownCheckInitialized>(_onOtpCountDownCheckInitialized);

    on<OtpCountDownCheckRestarted>(_onOtpCountDownCheckRestarted);
  }

  Future<void> _onOtpCountDownCheckInitialized(
    OtpCountDownCheckInitialized event,
    Emitter<OtpCountDownCheckState> emit,
  ) async {
    emit(state.copyWith(
      countDownController: CountdownTimerController(
        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 30,
        onEnd: () {
          add(
            const OtpCountDownCheckIsRunningChanged(
              isRunning: false,
            ),
          );
        },
      ),
    ));
  }

  Future<void> _onOtpCountDownCheckRestarted(
    OtpCountDownCheckRestarted event,
    Emitter<OtpCountDownCheckState> emit,
  ) async {
    state.countDownController!.endTime =
        DateTime.now().millisecondsSinceEpoch + 1000 * 30;

    state.countDownController!.start();
    add(
      const OtpCountDownCheckIsRunningChanged(
        isRunning: true,
      ),
    );
  }

  Future<void> _onOtpCountDownCheckIsRunningChanged(
    OtpCountDownCheckIsRunningChanged event,
    Emitter<OtpCountDownCheckState> emit,
  ) async {
    emit(state.copyWith(
      isRunning: event.isRunning,
    ));
  }
}

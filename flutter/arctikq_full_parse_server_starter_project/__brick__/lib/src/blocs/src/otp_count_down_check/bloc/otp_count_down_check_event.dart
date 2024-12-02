part of 'otp_count_down_check_bloc.dart';

abstract class OtpCountDownCheckEvent extends Equatable {
  const OtpCountDownCheckEvent();
  @override
  List<Object> get props => [];
}

class OtpCountDownCheckIsRunningChanged extends OtpCountDownCheckEvent {
  final bool isRunning;

  const OtpCountDownCheckIsRunningChanged({
    required this.isRunning,
  });
}

class OtpCountDownCheckInitialized extends OtpCountDownCheckEvent {}

class OtpCountDownCheckRestarted extends OtpCountDownCheckEvent {}

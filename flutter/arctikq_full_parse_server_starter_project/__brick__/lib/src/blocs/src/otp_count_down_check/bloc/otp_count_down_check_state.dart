// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'otp_count_down_check_bloc.dart';

class OtpCountDownCheckState extends Equatable {
  final CountdownTimerController? countDownController;
  final bool isRunning;

  const OtpCountDownCheckState({
    this.countDownController,
    this.isRunning = true,
  });

  @override
  List<Object?> get props => [
        countDownController,
        isRunning,
      ];

  OtpCountDownCheckState copyWith({
    CountdownTimerController? countDownController,
    bool? isRunning,
  }) {
    return OtpCountDownCheckState(
      countDownController: countDownController ?? this.countDownController,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}

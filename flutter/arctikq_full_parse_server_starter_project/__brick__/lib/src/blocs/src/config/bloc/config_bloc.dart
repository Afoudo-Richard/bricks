import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(const ConfigState()) {
    on<ConfigFetched>(_onConfigFetched);
  }

  Future<void> _onConfigFetched(
    ConfigFetched event,
    Emitter<ConfigState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          configListStatus: ConfigListStatus.loading,
        ),
      );
      final configs = await _fetchAppConfig();

      emit(
        state.copyWith(
          configListStatus: ConfigListStatus.success,
          privacyPolicy: configs['privacyPolicy'] ?? '',
          termsAndCondition: configs['termsAndCondition'] ?? '',
          whatsappHelpLine: configs['whatsappHelpLine'] ?? '',
          telegramHelpLine: configs['telegramHelpLine'] ?? '',
          aboutUs: configs['aboutUs'] ?? '',
          appIsBlocked: configs['appIsBlocked'] ?? false,
          youtubeProfileLink: configs['youtubeProfileLink'] ?? '',
          instagramProfileLink: configs['instagramProfileLink'] ?? '',
          facebookProfileLink: configs['facebookProfileLink'] ?? '',
          xProfileLink: configs['xProfileLink'] ?? '',
          ourMission: configs['ourMission'] ?? '',
          ourVision: configs['ourVision'] ?? '',
          showPropertyItemIndicator:
              configs['showPropertyItemIndicator'] ?? false,
          otpExpiresAfterMinutes: configs['otpExpiresAfterMinutes'] ?? 0,
        ),
      );
    } on ErrorResponse catch (e) {
      emit(
        state.copyWith(
          configListStatus: ConfigListStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          configListStatus: ConfigListStatus.failure,
        ),
      );
    }
  }

  Future _fetchAppConfig() async {
    var response = await ParseConfig().getConfigs();

    if (response.success) {
      return response.result;
    } else {
      throw ErrorResponse(message: response.error!.message);
    }
  }
}

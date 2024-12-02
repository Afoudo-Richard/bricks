// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'config_bloc.dart';

enum ConfigListStatus { initial, loading, success, failure, refresh }

class ConfigState extends Equatable {
  final String privacyPolicy;
  final String? termsAndCondition;
  final String youtubeProfileLink;
  final String facebookProfileLink;
  final String instagramProfileLink;
  final String xProfileLink;
  final String ourMission;
  final String ourVision;
  final ConfigListStatus configListStatus;
  final String? errorMessage;
  final String? whatsappHelpLine;
  final String? telegramHelpLine;
  final String? aboutUs;
  final int? otpExpiresAfterMinutes;
  final bool? showPropertyItemIndicator;
  final bool? appIsBlocked;

  const ConfigState({
    this.privacyPolicy = '',
    this.termsAndCondition = '',
    this.configListStatus = ConfigListStatus.initial,
    this.errorMessage,
    this.whatsappHelpLine,
    this.telegramHelpLine,
    this.aboutUs,
    this.appIsBlocked,
    this.youtubeProfileLink = '',
    this.facebookProfileLink = '',
    this.instagramProfileLink = '',
    this.xProfileLink = '',
    this.ourMission = '',
    this.ourVision = '',
    this.otpExpiresAfterMinutes = 0,
    this.showPropertyItemIndicator,
  });

  @override
  List<Object?> get props => [
        privacyPolicy,
        termsAndCondition,
        appIsBlocked,
        errorMessage,
        whatsappHelpLine,
        telegramHelpLine,
        aboutUs,
        appIsBlocked,
        youtubeProfileLink,
        facebookProfileLink,
        instagramProfileLink,
        xProfileLink,
        ourMission,
        ourVision,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'privacyPolicy': privacyPolicy,
      'termsAndCondition': termsAndCondition,
      'configListStatus': configListStatus.name,
      'ourMission': ourMission,
      'ourVision': ourVision,
      'aboutUs': aboutUs,
      'errorMessage': errorMessage,
    };
  }

  factory ConfigState.fromMap(Map<String, dynamic> map) {
    return ConfigState(
      privacyPolicy: map['privacyPolicy'] as String,
      termsAndCondition: map['termsAndCondition'] as String,
      aboutUs: map['aboutUs'] as String,
      configListStatus:
          ConfigListStatus.values.byName(map['configListStatus'] as String),
      errorMessage:
          map['errorMessage'] != null ? map['errorMessage'] as String : null,
      ourMission: map['ourMission'] as String,
      ourVision: map['ourVision'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigState.fromJson(String source) =>
      ConfigState.fromMap(json.decode(source) as Map<String, dynamic>);

  ConfigState copyWith({
    String? privacyPolicy,
    String? termsAndCondition,
    String? youtubeProfileLink,
    String? facebookProfileLink,
    String? instagramProfileLink,
    String? xProfileLink,
    String? ourMission,
    String? ourVision,
    ConfigListStatus? configListStatus,
    String? errorMessage,
    String? whatsappHelpLine,
    String? telegramHelpLine,
    String? aboutUs,
    int? otpExpiresAfterMinutes,
    bool? showPropertyItemIndicator,
    bool? appIsBlocked,
  }) {
    return ConfigState(
      privacyPolicy: privacyPolicy ?? this.privacyPolicy,
      termsAndCondition: termsAndCondition ?? this.termsAndCondition,
      youtubeProfileLink: youtubeProfileLink ?? this.youtubeProfileLink,
      facebookProfileLink: facebookProfileLink ?? this.facebookProfileLink,
      instagramProfileLink: instagramProfileLink ?? this.instagramProfileLink,
      xProfileLink: xProfileLink ?? this.xProfileLink,
      ourMission: ourMission ?? this.ourMission,
      ourVision: ourVision ?? this.ourVision,
      configListStatus: configListStatus ?? this.configListStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      whatsappHelpLine: whatsappHelpLine ?? this.whatsappHelpLine,
      telegramHelpLine: telegramHelpLine ?? this.telegramHelpLine,
      aboutUs: aboutUs ?? this.aboutUs,
      otpExpiresAfterMinutes:
          otpExpiresAfterMinutes ?? this.otpExpiresAfterMinutes,
      showPropertyItemIndicator:
          showPropertyItemIndicator ?? this.showPropertyItemIndicator,
      appIsBlocked: appIsBlocked ?? this.appIsBlocked,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

enum AuthenticationLogOutStatus { initial, success, failure, loading }

enum AuthenticationFetchUserStatus { initial, success, failure, loading }

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.authenticated = false,
    this.isSignedInAnonymous = false,
    this.checker = false,
    this.hasWalkedThrough = false,
    this.hasSeenMission = false,
    this.fcmToken,
    this.authenticationLogOutStatus = AuthenticationLogOutStatus.initial,
    this.authenticationFetchUserStatus = AuthenticationFetchUserStatus.initial,
  });

  final bool authenticated;
  final bool isSignedInAnonymous;
  final bool checker;
  final bool hasWalkedThrough;
  final bool hasSeenMission;
  final String? fcmToken;
  final AuthenticationLogOutStatus authenticationLogOutStatus;
  final AuthenticationFetchUserStatus authenticationFetchUserStatus;

  AuthenticationState copyWith({
    bool? authenticated,
    bool? isSignedInAnonymous,
    bool? checker,
    bool? hasWalkedThrough,
    bool? hasSeenMission,
    String? fcmToken,
    AuthenticationLogOutStatus? authenticationLogOutStatus,
    AuthenticationFetchUserStatus? authenticationFetchUserStatus,
  }) {
    return AuthenticationState(
      authenticated: authenticated ?? this.authenticated,
      isSignedInAnonymous: isSignedInAnonymous ?? this.isSignedInAnonymous,
      checker: checker ?? this.checker,
      hasWalkedThrough: hasWalkedThrough ?? this.hasWalkedThrough,
      hasSeenMission: hasSeenMission ?? this.hasSeenMission,
      fcmToken: fcmToken ?? this.fcmToken,
      authenticationLogOutStatus:
          authenticationLogOutStatus ?? this.authenticationLogOutStatus,
      authenticationFetchUserStatus:
          authenticationFetchUserStatus ?? this.authenticationFetchUserStatus,
    );
  }

  @override
  List<Object?> get props => [
        authenticated,
        isSignedInAnonymous,
        checker,
        hasWalkedThrough,
        hasSeenMission,
        fcmToken,
        authenticationLogOutStatus,
        authenticationFetchUserStatus,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'authenticated': authenticated,
      'isSignedInAnonymous': isSignedInAnonymous,
      'checker': checker,
      'hasWalkedThrough': hasWalkedThrough,
      'hasSeenMission': hasSeenMission,
      'fcmToken': fcmToken,
    };
  }

  factory AuthenticationState.fromMap(Map<String, dynamic> map) {
    return AuthenticationState(
      authenticated: map['authenticated'] as bool,
      isSignedInAnonymous: map['isSignedInAnonymous'] as bool,
      checker: map['checker'] as bool,
      hasWalkedThrough: map['hasWalkedThrough'] as bool,
      hasSeenMission: map['hasSeenMission'] as bool,
      fcmToken: map['fcmToken'] != null ? map['fcmToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationState.fromJson(String source) =>
      AuthenticationState.fromMap(json.decode(source) as Map<String, dynamic>);
}

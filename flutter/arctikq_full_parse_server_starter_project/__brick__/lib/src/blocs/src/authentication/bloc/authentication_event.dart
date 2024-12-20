// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

// class AuthenticationStatusChanged extends AuthenticationEvent {
//   const AuthenticationStatusChanged(this.status);

//   final AuthenticationStatus status;

//   @override
//   List<Object> get props => [status];
// }

class AuthenticationLogoutRequested extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationChanged extends AuthenticationEvent {
  const AuthenticationChanged({
    required this.authenticated,
    required this.fcmToken,
  });
  final bool authenticated;
  final String? fcmToken;

  @override
  List<Object?> get props => [authenticated, fcmToken];
}

class AuthenticationUserChanged extends AuthenticationEvent {
  const AuthenticationUserChanged({
    required this.user,
  });
  final User? user;

  @override
  List<Object?> get props => [user];
}

class AuthenticationHasWalkedThroughChanged extends AuthenticationEvent {
  final bool hasWalkedThrough;
  const AuthenticationHasWalkedThroughChanged({
    required this.hasWalkedThrough,
  });

  @override
  List<Object> get props => [hasWalkedThrough];
}

class AuthenticationSignInAnonymous extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationChecker extends AuthenticationEvent {
  final bool check;
  const AuthenticationChecker({
    required this.check,
  });

  @override
  List<Object> get props => [check];
}

class AuthenticationHasSeenMissionChanged extends AuthenticationEvent {
  const AuthenticationHasSeenMissionChanged({
    required this.value,
  });
  final bool value;

  @override
  List<Object?> get props => [value];
}

class AuthenticationFetchUserData extends AuthenticationEvent {}

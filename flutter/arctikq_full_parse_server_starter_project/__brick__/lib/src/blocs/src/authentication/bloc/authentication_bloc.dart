import 'dart:convert';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  final UserBloc userBloc;

  AuthenticationBloc({
    required this.userBloc,
  }) : super(const AuthenticationState()) {
    on<AuthenticationChanged>(_onAuthenticationChanged);
    on<AuthenticationUserChanged>(_onAuthenticationUserChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    on<AuthenticationChecker>(_onAuthenticationChecker);
    on<AuthenticationHasWalkedThroughChanged>(
        _onAuthenticationHasWalkedThroughChanged);
    on<AuthenticationSignInAnonymous>(_onAuthenticationSignInAnonymous);
    on<AuthenticationHasSeenMissionChanged>(
        _onAuthenticationHasSeenMissionChanged);

    on<AuthenticationFetchUserData>(_onAuthenticationFetchUserData);
  }

  void _onAuthenticationHasWalkedThroughChanged(
    AuthenticationHasWalkedThroughChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit(
      state.copyWith(
        hasWalkedThrough: event.hasWalkedThrough,
      ),
    );
  }

  void _onAuthenticationSignInAnonymous(
    AuthenticationSignInAnonymous event,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit(
      state.copyWith(
        isSignedInAnonymous: true,
      ),
    );
  }

  void _onAuthenticationChanged(
    AuthenticationChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit(
      state.copyWith(
        authenticated: event.authenticated,
        fcmToken: event.fcmToken,
      ),
    );
  }

  void _onAuthenticationUserChanged(
    AuthenticationUserChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit(
      state.copyWith(
        checker: !state.checker,
      ),
    );
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    User user = await ParseUser.currentUser();

    // var removeResponse = await user.remove("devices", [fcmToken]);

    // user.devices = List.of(user.devices!)..remove(fcmToken);
    if (state.fcmToken != null) {
      user.devices = List.of(user.devices!)..remove(state.fcmToken);

      await user.update();
    }

    emit(state.copyWith(
      authenticationLogOutStatus: AuthenticationLogOutStatus.loading,
    ));

    var response = await user.logout();

    if (response.success) {
      emit(state.copyWith(
        authenticated: false,
        isSignedInAnonymous: false,
        hasSeenMission: false,
        authenticationLogOutStatus: AuthenticationLogOutStatus.success,
      ));

      userBloc.add(const UserChanged());
    } else {
      emit(state.copyWith(
        authenticationLogOutStatus: AuthenticationLogOutStatus.failure,
      ));
    }
  }

  void _onAuthenticationChecker(
    AuthenticationChecker event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(
      state.copyWith(checker: event.check),
    );
  }

  void _onAuthenticationHasSeenMissionChanged(
    AuthenticationHasSeenMissionChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit(
      state.copyWith(
        checker: !state.checker,
        hasSeenMission: event.value,
      ),
    );
  }

  void _onAuthenticationFetchUserData(
    AuthenticationFetchUserData event,
    Emitter<AuthenticationState> emit,
  ) async {
    if (state.authenticated && userBloc.state.user != null) {
      emit(state.copyWith(
        authenticationFetchUserStatus: AuthenticationFetchUserStatus.loading,
      ));

      try {
        var user = await _fetcheUser();
        userBloc.add(UserChanged(user: user));

        emit(
          state.copyWith(
            authenticationFetchUserStatus:
                AuthenticationFetchUserStatus.success,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            authenticationFetchUserStatus:
                AuthenticationFetchUserStatus.failure,
          ),
        );
      }
    }
  }

  Future<User> _fetcheUser() async {
    QueryBuilder<User> query = QueryBuilder(User())
      ..whereEqualTo('objectId', userBloc.state.user!.objectId);

    final response = await User().getObject(userBloc.state.user!.objectId!);

    return response.result as User;
  }

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    return AuthenticationState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    return state.toMap();
  }
}

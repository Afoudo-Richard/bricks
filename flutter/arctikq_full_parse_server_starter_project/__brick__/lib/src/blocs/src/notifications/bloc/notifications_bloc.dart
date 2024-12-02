import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc
    extends HydratedBloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsState()) {
    on<NotificationAdded>(_onNotificationAdded);
    on<NotificationMarkAsRead>(_onNotificationMarkAsRead);
    on<NotificationMarkAllAsRead>(_onNotificationMarkAllAsRead);
    on<NotificationsCleared>(_onNotificationsCleared);

    LiveQueryStreams.notificationStream.stream.listen((notification) {
      add(NotificationAdded(notification: notification));
    });
  }
  Future<void> _onNotificationsCleared(
    NotificationsCleared event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      NotificationsState(),
    );
  }

  Future<void> _onNotificationMarkAllAsRead(
    NotificationMarkAllAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final newList = state.notifications
        .map<Notification>((e) => e.copyWith(isRead: true))
        .toList();
    emit(
      state.copyWith(
        notifications: List.of(newList),
      ),
    );
  }

  Future<void> _onNotificationMarkAsRead(
    NotificationMarkAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final newList = state.notifications.map<Notification>((e) {
      if (e == event.notification) {
        return e.copyWith(isRead: true);
      }
      return e;
    }).toList();

    emit(
      state.copyWith(
        notifications: List.of(newList),
      ),
    );
  }

  Future<void> _onNotificationAdded(
    NotificationAdded event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      state.copyWith(
        notifications: List.of(state.notifications)..add(event.notification),
      ),
    );
  }

  @override
  NotificationsState? fromJson(Map<String, dynamic> json) {
    return NotificationsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(NotificationsState state) {
    return state.toMap();
  }
}

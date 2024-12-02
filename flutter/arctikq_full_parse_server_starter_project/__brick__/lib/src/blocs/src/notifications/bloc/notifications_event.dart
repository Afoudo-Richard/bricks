part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  NotificationsEvent();
  @override
  List<Object> get props => [];
}

class NotificationAdded extends NotificationsEvent {
  final Notification notification;
  NotificationAdded({
    required this.notification,
  });
}

class NotificationMarkAsRead extends NotificationsEvent {
  final Notification notification;
  NotificationMarkAsRead({
    required this.notification,
  });
}

class NotificationMarkAllAsRead extends NotificationsEvent {}

class NotificationsCleared extends NotificationsEvent {}

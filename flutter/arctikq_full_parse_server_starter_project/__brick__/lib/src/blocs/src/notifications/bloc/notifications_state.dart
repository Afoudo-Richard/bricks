part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  final List<Notification> notifications;

  NotificationsState({
    this.notifications = const [],
  });

  @override
  List<Object> get props => [
        notifications,
      ];

  int get totalUnreadNotifications {
    return notifications
        .where((notification) => notification.isRead == false)
        .toList()
        .length;
  }

  NotificationsState copyWith({
    List<Notification>? notifications,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'notifications': notifications.map((x) => x.toMap()).toList(),
    };
  }

  factory NotificationsState.fromMap(Map<String, dynamic> map) {
    return NotificationsState(
      notifications: List<Notification>.from(
        (map['notifications'] as List<dynamic>).map<Notification>(
          (x) => Notification.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationsState.fromJson(String source) =>
      NotificationsState.fromMap(json.decode(source) as Map<String, dynamic>);
}

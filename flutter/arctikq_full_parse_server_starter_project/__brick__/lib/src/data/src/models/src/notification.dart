// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  String title;
  String body;
  bool isRead;
  DateTime dateTime;

  Notification({
    required this.title,
    required this.body,
    required this.isRead,
    required this.dateTime,
  });

  @override
  List<Object> get props => [
        title,
        body,
        isRead,
        dateTime,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'isRead': isRead,
      'dateTime': dateTime.toString(),
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      title: map['title'] as String,
      body: map['body'] as String,
      isRead: map['isRead'] as bool,
      dateTime: DateTime.parse(map['dateTime'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) =>
      Notification.fromMap(json.decode(source) as Map<String, dynamic>);

  Notification copyWith({
    String? title,
    String? body,
    bool? isRead,
    DateTime? dateTime,
  }) {
    return Notification(
      title: title ?? this.title,
      body: body ?? this.body,
      isRead: isRead ?? this.isRead,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}

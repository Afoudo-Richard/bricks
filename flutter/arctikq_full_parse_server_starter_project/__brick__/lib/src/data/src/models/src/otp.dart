import 'dart:convert';

import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:equatable/equatable.dart';

class Otp extends ParseObject implements ParseCloneable {
  Otp() : super(keyTableName);
  Otp.clone() : this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override
  clone(Map<String, dynamic> map) => Otp.clone()..fromJson(map);

  static const String keyTableName = 'Otp';

  String? get password => get<String?>('password');
  set password(String? value) => set<String?>('password', value);

  String? get phone => get<String?>('phone');
  set phone(String? value) => set<String?>('phone', value);

  DateTime? get expiringDate => get<DateTime?>('expiringDate');
  set expiringDate(DateTime? value) => set<DateTime?>('expiringDate', value);

  @override
  List<Object?> get props => [
        objectId,
        password,
        phone,
        createdAt,
      ];
}

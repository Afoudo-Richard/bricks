import 'dart:convert';

import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:equatable/equatable.dart';

class Ctry extends ParseObject implements ParseCloneable {
  Ctry() : super(keyTableName);
  Ctry.clone() : this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override
  clone(Map<String, dynamic> map) => Ctry.clone()..fromJson(map);

  static const String keyTableName = 'Ctry';

  String? get name => get<String?>('name');
  set name(String? value) => set<String?>('name', value);

  String? get dialCode => get<String?>('dialCode');
  set dialCode(String? value) => set<String?>('dialCode', value);

  String? get flag => get<String?>('flag');
  set flag(String? value) => set<String?>('flag', value);

  bool get isPublished => get<bool?>('isPublished') ?? false;
  set isPublished(bool value) => set<bool?>('isPublished', value);

  @override
  List<Object?> get props => [
        objectId,
        name,
        dialCode,
        flag,
        isPublished,
        createdAt,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'name': name,
      'dialCode': dialCode,
      'isPublished': isPublished,
      'flag': flag,
    };
  }

  factory Ctry.fromMap(Map<String, dynamic> map) {
    return Ctry()
      ..objectId = map['objectId']
      ..name = map['name'] != null ? map['name'] as String : null
      ..dialCode = map['dialCode'] != null ? map['dialCode'] as String : null
      ..flag = map['flag'] != null ? map['flag'] as String : null;
  }

  String to_json() => json.encode(toMap());

  factory Ctry.fromJson(String source) =>
      Ctry.fromMap(json.decode(source) as Map<String, dynamic>);
}

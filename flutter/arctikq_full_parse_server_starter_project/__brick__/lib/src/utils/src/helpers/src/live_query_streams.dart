import 'dart:async';

import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class LiveQueryStreams {
  LiveQueryStreams._();

  factory LiveQueryStreams() {
    return _instance;
  }

  static final LiveQueryStreams _instance = LiveQueryStreams._();
  static LiveQueryStreams get instance => _instance;

  static final userUpdateStream = StreamController<User>.broadcast();
  static final notificationStream = StreamController<Notification>.broadcast();
  static final titleCtlr = StreamController<String>.broadcast();
  static final bodyCtlr = StreamController<String>.broadcast();

  static dispose() {
    userUpdateStream.close();
    // bookingUpdateStream.close();
    // transactionUpdateStream.close();
    // servicesChangeStream.close();
    notificationStream.close();
    bodyCtlr.close();
    titleCtlr.close();
  }
}

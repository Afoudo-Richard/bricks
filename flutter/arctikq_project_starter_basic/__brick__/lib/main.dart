import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:{{project_name.snakeCase()}}/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}

import 'package:flutter/material.dart';
import 'package:{{project_name.lowerCase()}}/{{project_name.lowerCase()}}.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          '{{project_name.titleCase()}}',
        ),
      ),
    );
  }
}

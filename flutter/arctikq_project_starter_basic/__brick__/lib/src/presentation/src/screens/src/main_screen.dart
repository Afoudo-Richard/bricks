import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: const AppDrawer(),
        body: Container(
      child: Text(
        "Main Screen",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    )
        // bottomNavigationBar: const AppBottomNavigationBar(),
        );
  }
}

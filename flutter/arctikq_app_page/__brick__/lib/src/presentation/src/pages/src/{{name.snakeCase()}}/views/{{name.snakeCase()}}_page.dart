import 'package:flutter/material.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const {{name.pascalCase()}}Page());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("{{name.sentenceCase()}}"),
      ),
      body: Container(),);
  }
}

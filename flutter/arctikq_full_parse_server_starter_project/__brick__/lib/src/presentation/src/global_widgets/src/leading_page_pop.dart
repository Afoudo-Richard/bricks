import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class LeadingPagePop extends StatelessWidget {
  const LeadingPagePop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 30.0,
          height: 30.0,
          margin: const EdgeInsets.symmetric(vertical: 11),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

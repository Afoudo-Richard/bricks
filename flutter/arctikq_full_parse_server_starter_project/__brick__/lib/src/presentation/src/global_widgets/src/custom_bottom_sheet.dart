import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:flutter/material.dart';

void customBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    elevation: 10.0,
    useRootNavigator: true,
    shape: bottomSheetShape,
    builder: (context) {
      return child;
    },
  );
}

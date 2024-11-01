import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class LeadingPopCircle extends StatelessWidget {
  const LeadingPopCircle({
    super.key,
    this.margin,
    this.padding,
    this.icon,
  });

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return CustomCircleWithIcon(
      onTap: () => Navigator.pop(context),
      margin: margin,
      padding: padding,
      icon: icon,
    );
  }
}

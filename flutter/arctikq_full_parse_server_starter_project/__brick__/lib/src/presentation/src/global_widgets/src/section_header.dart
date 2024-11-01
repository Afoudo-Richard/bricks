import "package:flutter/material.dart";
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
    this.trailing = const SizedBox.shrink(),
    this.titleTextStyle,
    this.titleColor,
    this.titleFontSize,
  }) : super(key: key);

  final String title;
  final Widget trailing;
  final TextStyle? titleTextStyle;
  final Color? titleColor;
  final double? titleFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize ?? 16.sp,
            fontWeight: FontWeight.w700,
            color: titleColor ?? Colors.black,
          ).merge(titleTextStyle),
        ),
        trailing,
      ],
    );
  }
}

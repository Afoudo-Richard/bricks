import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:flutter/material.dart';

class TextChip extends StatelessWidget {
  const TextChip({
    super.key,
    this.bgColor = primaryColor,
    this.textColor = Colors.white,
    required this.text,
    this.textFontSize,
    this.textfontWeight,
    this.textFontFamily,
    this.leading,
    this.trailing,
  });

  final Color bgColor;
  final Color textColor;
  final String text;
  final String? textFontFamily;
  final Widget? leading;
  final Widget? trailing;
  final double? textFontSize;
  final FontWeight? textfontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          leading ?? const SizedBox.shrink(),
          Text(
            text,
            style: TextStyle(
              fontSize: textFontSize ?? 7.sp,
              color: textColor,
              fontWeight: textfontWeight ?? FontWeight.w400,
              fontFamily: textFontFamily ?? "Inter",
            ),
          ),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.child,
    this.padding,
    this.border,
    this.elevation,
  }) : super(key: key);

  final void Function()? onPressed;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final BorderSide? border;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: MaterialStateProperty.all(
            padding ?? EdgeInsets.symmetric(vertical: kwS ? 12.sp : 6.sp),
          ),
          side: MaterialStateProperty.all(border),
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(40),
            ),
          ),
          // shadowColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(elevation ?? 3.sp)),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class CustomCircleWithIcon extends StatelessWidget {
  const CustomCircleWithIcon({
    super.key,
    this.margin,
    this.padding,
    this.onTap,
    this.boxShadow,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.radius,
  });

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  final List<BoxShadow>? boxShadow;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap != null ? onTap!() : Navigator.pop(context);
      },
      child: CustomCircle(
        margin: margin,
        padding: padding,
        radius: radius ?? 40.sp,
        color: backgroundColor ?? Colors.white,
        boxShadow: boxShadow ??
            const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                spreadRadius: 0,
                offset: Offset(0, 5),
              ),
            ],
        child: Icon(
          icon ?? Icons.arrow_back,
          color: iconColor ?? Colors.black,
          size: 20.sp,
        ),
      ),
    );
  }
}

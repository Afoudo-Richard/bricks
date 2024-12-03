import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:{{project_name.snakeCase()}}/src/utils/utils.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    Key? key,
    this.backgroundColor,
    this.borderRadius,
    this.leading,
    this.trailing,
    this.inputTextStyle,
    this.inputHintText,
    this.inputErrorText,
    this.inputBorder,
    this.border,
    this.controller,
    this.textAlign,
    this.inputKeyBoardType,
    this.inputObscureText = false,
    this.onChanged,
    this.inputInitialValue,
    this.inputMaxLines = 1,
    this.inputMinLines,
    this.padding,
    this.label,
    this.labelTextStyle,
    this.inputTextCapitalization = TextCapitalization.none,
    this.leadingAndTrailingPosition = CrossAxisAlignment.center,
    this.inputEnabled,
    this.inputText,
  }) : super(key: key);

  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? inputTextStyle;
  final String? inputHintText;
  final String? inputErrorText;
  final InputBorder? inputBorder;
  final BoxBorder? border;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final TextInputType? inputKeyBoardType;
  final bool inputObscureText;
  final void Function(String)? onChanged;
  final String? inputInitialValue;
  final int inputMaxLines;
  final int? inputMinLines;
  final EdgeInsetsGeometry? padding;
  final String? label;
  final TextStyle? labelTextStyle;
  final TextCapitalization inputTextCapitalization;
  final CrossAxisAlignment leadingAndTrailingPosition;
  final bool? inputEnabled;
  final String? inputText;

  List<Widget> get labelWidgets {
    return [
      Text(
        label!,
        style: inputLabelTextStyle.merge(labelTextStyle),
      ),
      SizedBox(
        height: 1.h,
      )
    ];
  }

  TextStyle get inputTextStyles {
    return TextStyle(
      fontSize: kwS
          ? 18.sp
          : kwM
              ? 7.sp
              : 4.sp,
      fontWeight: FontWeight.w600,
      color: primaryColor,
    ).merge(inputTextStyle);
  }

  InputDecoration get inputDecorations {
    return InputDecoration(
      border: inputBorder ?? InputBorder.none,
      hintText: inputHintText,
      contentPadding: EdgeInsets.zero,
      isDense: true,
      // fillColor: Colors.red,
      // filled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...labelWidgets,
        Container(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            border: border ??
                Border.all(
                    color: inputErrorText != null
                        ? Colors.red
                        : primaryColor.withOpacity(0.5)),
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(5),
                ),
          ),
          child: Row(
            crossAxisAlignment: leadingAndTrailingPosition,
            children: [
              if (leading != null) leading!,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              inputText != null
                  ? Expanded(
                      child: Text(
                        inputText!,
                        style: inputTextStyle,
                      ),
                    )
                  : Expanded(
                      child: Transform.translate(
                        offset: Offset(0, kwS ? 3.sp : 0.sp),
                        child: TextFormField(
                          controller: controller,
                          minLines: inputMinLines,
                          maxLines: inputObscureText ? 1 : inputMaxLines,
                          initialValue: inputInitialValue,
                          keyboardType: inputKeyBoardType,
                          obscureText: inputObscureText,
                          style: inputTextStyle,
                          // style: TextStyle(
                          //   fontSize: Responsive.isMobile(context)
                          //       ? 18.sp
                          //       : Responsive.isTablet(context)
                          //           ? 7.sp
                          //           : 4.sp,
                          //   fontWeight: FontWeight.w600,
                          //   color: primaryColor,
                          // ).merge(inputTextStyle),
                          decoration: inputDecorations,
                          onChanged: onChanged,
                          textCapitalization: inputTextCapitalization,
                          enabled: inputEnabled,
                        ),
                      ),
                    ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
        inputErrorText != null
            ? Padding(
                padding: EdgeInsets.only(
                  left: kwS ? 10.sp : 3.sp,
                  top: kwS ? 3.sp : 1.sp,
                ),
                child: Text(
                  inputErrorText!,
                  style: TextStyle(
                    fontSize: kwS ? 8.sp : 2.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              )
            : 0.s,
      ],
    );
  }
}

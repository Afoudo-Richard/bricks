import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF225DE8);
const Color secondaryColor = Color(0xFFFFA500);
const Color contentBackgroundColor = Color(0XFFE5E5E5);
const Color allGameCardColor = Color.fromRGBO(230, 230, 230, 1);
const Color darkSecondaryColor = Color(0XFF444444);
const Color darkColor = Color(0XFF171717);

double iconSize = kwS
    ? 18.sp
    : kwM
        ? 7.sp
        : 4.sp;

const double paddingSize = 13;

const EdgeInsets pagePadding =
    EdgeInsets.symmetric(horizontal: paddingSize, vertical: 0);

Size deviceSize(context) => MediaQuery.of(context).size;
double deviceHeight(context) => MediaQuery.of(context).size.height;
double deviceWidth(context) => MediaQuery.of(context).size.width;

/// input background color
Color inputBackgroundColor = Colors.grey.withOpacity(0.1);

TextStyle inputLabelTextStyle = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  color: primaryColor,
);

TextStyle buttonTextStyle = TextStyle(
  fontSize: kwS ? 14.sp : 4.sp,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

TextStyle pageTitleTextStyle = TextStyle(
  fontSize: 16.sp,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);

const bottomSheetShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(16.0),
    topRight: Radius.circular(16.0),
  ),
);

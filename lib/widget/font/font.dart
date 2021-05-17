import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

rigthfont(String text, double size, colors) {
  return Text(text,
      style: TextStyle(
          color: colors,
          fontWeight: FontWeight.w500,
          fontFamily: "M_Ligint",
          fontStyle: FontStyle.normal,
          fontSize: size.sp),
      textAlign: TextAlign.left);
}

mediumfont(String text, double size, colors) {
  return Text(text,
      style: TextStyle(
          color: colors,
          fontWeight: FontWeight.w500,
          fontFamily: "M_Medium",
          fontStyle: FontStyle.normal,
          fontSize: size.sp),
      textAlign: TextAlign.left);
}

boldfont(String text, double size, colors) {
  return Text(text,
      style: TextStyle(
          color: colors,
          fontWeight: FontWeight.w700,
          fontFamily: "M_Bold",
          fontStyle: FontStyle.normal,
          fontSize: size.sp),
      textAlign: TextAlign.left);
}

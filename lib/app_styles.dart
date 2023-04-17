import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle get({TextStyle? style}) {
    return const TextStyle(fontFamily: 'Alexandria').merge(style);
  }

  static TextStyle body({required Color color}) {
    return AppStyles.get().merge(
      TextStyle(
        color: color,
        fontSize: 14.sp,
        letterSpacing: 0.14.w,
        fontFamily: "Inter",
      ),
    );
  }

  static TextStyle body16({required Color color}) {
    return AppStyles.get().merge(
      TextStyle(
        color: color,
        fontSize: 16.sp,
        letterSpacing: 0.32.w,
        fontFamily: "Inter",
      ),
    );
  }

  static TextStyle body18({required Color color}) {
    return AppStyles.get().merge(
      TextStyle(
        color: color,
        fontSize: 18.sp,
        letterSpacing: 0.36.w,
        fontFamily: "Inter",
      ),
    );
  }

  static TextStyle head1({required Color color}) {
    return AppStyles.get().merge(
      TextStyle(
        color: color,
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

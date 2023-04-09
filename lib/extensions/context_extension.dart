import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextExtention on BuildContext {
  double getDynmaicHeight(double val) => 1.sh * val;
  double getDynmaicWidth(double val) => 1.sw * val;
}

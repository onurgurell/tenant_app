import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/base_area/base_area.dart';

class ExplainYourSelfArea extends StatelessWidget {
  const ExplainYourSelfArea({super.key});
  final height = 200.0;

  @override
  Widget build(BuildContext context) {
    return BaseArea(
      title: AppStrings.explainYourSelfTitle,
      widget: [
        SizedBox(height: 20.h),
        SizedBox(
          height: height,
          width: context.getDynmaicWidth(.9),
          child: TextField(
            textInputAction: TextInputAction.done,
            maxLength: 300,
            maxLines: height ~/ 20,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              filled: true,
              fillColor: BaseTheme.mainWhiteColor,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: BaseTheme.expressDefaultColor),
                borderRadius: BorderRadius.circular(8.sp),
              ),
              hintStyle: TextStyle(
                fontSize: 14.sp,
              ),
              hintText: AppStrings.explainYourSelfDescription,
            ),
          ),
        ),
      ],
    );
  }
}

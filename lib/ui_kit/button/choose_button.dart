import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';

class ChooseButton extends StatelessWidget {
  const ChooseButton({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: context.getDynmaicWidth(.9),
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: BaseTheme.expressDefaultColor,
            ),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: TextStyleGenerator(text: title),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: BaseTheme.mainBlackColor,
                      width: 4,
                    ),
                  ),
                  child: Icon(
                    Icons.question_mark,
                    size: 12.sp,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

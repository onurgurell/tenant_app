import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/button/select_button.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';

class GenderArea extends StatelessWidget {
  const GenderArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyleGenerator(
          text: AppStrings.yourGenderTitle,
          fontSize: 18.sp,
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 200.h,
          width: context.getDynmaicWidth(.9),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SelectButton(
                    title: AppStrings.genderFemale,
                  ),
                  SizedBox(height: 8.h),
                  const SelectButton(title: AppStrings.genderMale),
                  SizedBox(height: 8.h),
                  const SelectButton(title: AppStrings.genderOther),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

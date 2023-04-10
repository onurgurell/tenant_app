import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/base_area/base_area.dart';
import 'package:tenant_app/ui_kit/button/multi_button.dart';

class GenderArea extends StatelessWidget {
  const GenderArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseArea(
      title: AppStrings.yourGenderTitle,
      widget: [
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

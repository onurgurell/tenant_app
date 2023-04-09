import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/ui_kit/base_area/base_area.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';

class SalaryOrRentArea extends StatelessWidget {
  const SalaryOrRentArea({
    super.key,
    required this.title,
    required this.hintText,
  });
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return BaseArea(
      title: title,
      widget: [
        SizedBox(height: 20.h),
        SizedBox(
          height: 50.h,
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: BaseTheme.mainWhiteColor,
              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 10.h, right: 2),
                child: const TextStyleGenerator(
                  text: AppStrings.expressCurrencyText,
                  fontSize: 16,
                  color: BaseTheme.expressDefaultColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: BaseTheme.expressDefaultColor),
                borderRadius: BorderRadius.circular(8.sp),
              ),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}

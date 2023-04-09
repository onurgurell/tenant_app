import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/button/select_button.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

class PetArea extends StatelessWidget {
  const PetArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpressYourselfViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyleGenerator(
              text: AppStrings.petHaveTitle,
              fontSize: 18.sp,
            ),
            SizedBox(height: 12.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _selectedTab(
                  context,
                  1,
                  AppStrings.expressYesTitle,
                  viewModel.selectedPetButton == 1
                      ? BaseTheme.expressSelectedColor
                      : BaseTheme.expressNotSelectedBorderColor,
                  viewModel.selectedPetButton == 1
                      ? BaseTheme.expressSelectedButtonColor
                      : BaseTheme.mainWhiteColor,
                ),
                _selectedTab(
                  context,
                  2,
                  AppStrings.expressNoTitle,
                  viewModel.selectedPetButton == 2
                      ? BaseTheme.expressSelectedColor
                      : BaseTheme.expressNotSelectedBorderColor,
                  viewModel.selectedPetButton == 2
                      ? BaseTheme.expressSelectedButtonColor
                      : BaseTheme.mainWhiteColor,
                )
              ],
            ),
            SizedBox(height: 40.h),
            viewModel.selectedPetButton == 1
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleGenerator(
                        text: AppStrings.petCountTitle,
                        fontSize: 18.sp,
                      ),
                      SizedBox(height: 12.h),
                      const SelectButton(title: AppStrings.petOneText),
                      SizedBox(height: 8.h),
                      const SelectButton(title: AppStrings.petTwoText),
                      SizedBox(height: 8.h),
                      const SelectButton(title: AppStrings.petThreeext),
                      SizedBox(height: 20.h),
                    ],
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }

  InkWell _selectedTab(BuildContext context, int selectIndex, String title,
      Color borderColor, Color buttonColor) {
    return InkWell(
      onTap: () {
        Provider.of<ExpressYourselfViewModel>(context, listen: false)
            .updateYesOrNoButton(selectIndex);
      },
      child: Container(
        height: 50.h,
        width: context.getDynmaicWidth(.4),
        decoration: BoxDecoration(
          color: selectIndex == 0 ? BaseTheme.mainWhiteColor : buttonColor,
          border: Border.all(
              color: selectIndex == 0
                  ? BaseTheme.expressNotSelectedBorderColor
                  : borderColor),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Center(
          child: TextStyleGenerator(
            text: title,
          ),
        ),
      ),
    );
  }
}

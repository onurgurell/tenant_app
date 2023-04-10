import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/base_area/base_area.dart';
import 'package:tenant_app/ui_kit/button/multi_button.dart';
import 'package:tenant_app/ui_kit/button/yes_Or_no_button.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

class PetArea extends StatelessWidget {
  const PetArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpressYourselfViewModel>(
      builder: (context, viewModel, child) {
        return BaseArea(
          title: AppStrings.petHaveTitle,
          widget: [
            SizedBox(height: 12.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                YesOrNoButton(
                  onTap: () => viewModel.petYesOrNoButton(1),
                  title: AppStrings.expressYesTitle,
                  buttonColor: viewModel.selectedPetButton == 1
                      ? BaseTheme.expressSelectedButtonColor
                      : BaseTheme.mainWhiteColor,
                  borderColor: viewModel.selectedPetButton == 1
                      ? BaseTheme.expressSelectedColor
                      : BaseTheme.expressNotSelectedBorderColor,
                  selectIndex: 1,
                ),
                YesOrNoButton(
                  onTap: () => viewModel.petYesOrNoButton(2),
                  title: AppStrings.expressNoTitle,
                  buttonColor: viewModel.selectedPetButton == 2
                      ? BaseTheme.expressSelectedButtonColor
                      : BaseTheme.mainWhiteColor,
                  borderColor: viewModel.selectedPetButton == 2
                      ? BaseTheme.expressSelectedColor
                      : BaseTheme.expressNotSelectedBorderColor,
                  selectIndex: 1,
                ),
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
}

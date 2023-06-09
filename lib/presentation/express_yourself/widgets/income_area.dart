import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/base_area/base_area.dart';
import 'package:tenant_app/ui_kit/button/choose_button.dart';
import 'package:tenant_app/ui_kit/button/yes_or_no_button.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

class IncomeArea extends StatelessWidget {
  const IncomeArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpressYourselfViewModel>(
      builder: (context, viewModel, child) {
        return BaseArea(
          title: AppStrings.incomeHaveTitle,
          widget: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                YesOrNoButton(
                  onTap: () => viewModel.incomeYesOrNoButton(1),
                  selectIndex: 1,
                  title: AppStrings.expressYesTitle,
                  borderColor: viewModel.selectedIncomeButton == 1
                      ? BaseTheme.expressSelectedColor
                      : BaseTheme.expressNotSelectedBorderColor,
                  buttonColor: viewModel.selectedIncomeButton == 1
                      ? BaseTheme.expressSelectedButtonColor
                      : BaseTheme.mainWhiteColor,
                ),
                YesOrNoButton(
                  onTap: () => viewModel.incomeYesOrNoButton(2),
                  selectIndex: 2,
                  title: AppStrings.expressNoTitle,
                  borderColor: viewModel.selectedIncomeButton == 2
                      ? BaseTheme.expressSelectedColor
                      : BaseTheme.expressNotSelectedBorderColor,
                  buttonColor: viewModel.selectedIncomeButton == 2
                      ? BaseTheme.expressSelectedButtonColor
                      : BaseTheme.mainWhiteColor,
                ),
              ],
            ),
            viewModel.selectedIncomeButton == 1
                ? SizedBox(height: 40.h)
                : const SizedBox(),
            viewModel.selectedIncomeButton != 1
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleGenerator(
                        text: AppStrings.incomeTypeTitle,
                        fontSize: 17.sp,
                      ),
                      SizedBox(height: 8.h),
                      ChooseButton(
                        onTap: () {},
                        title: AppStrings.expressChooseHintTitle,
                      ),
                      for (int i = 0;
                          i < viewModel.addIncomeList.length;
                          i++) ...{
                        SizedBox(height: 8.h),
                        viewModel.addIncomeList.isEmpty
                            ? const SizedBox()
                            : ChooseButton(
                                onTap: () {},
                                title: AppStrings.expressChooseHintTitle),
                      },
                      SizedBox(height: 28.h),
                      InkWell(
                        onTap: () {
                          viewModel.addIncome(const SizedBox());
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 16.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.sp),
                                border: Border.all(
                                    color: BaseTheme.expressSelectedColor,
                                    width: 2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.question_mark,
                                  color: BaseTheme.expressSelectedColor,
                                  size: 10,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            const TextStyleGenerator(
                              text: AppStrings.incomeAddButton,
                              color: BaseTheme.expressSelectedColor,
                            )
                          ],
                        ),
                      )
                    ],
                  )
          ],
        );
      },
    );
  }
}

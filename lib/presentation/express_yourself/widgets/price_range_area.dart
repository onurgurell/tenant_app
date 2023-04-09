import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/base_area/base_area.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

class PriceRangeArea extends StatelessWidget {
  const PriceRangeArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpressYourselfViewModel>(
      builder: (context, viewModel, child) {
        final currentRange = viewModel.currentRangeValues;
        return BaseArea(
          title: AppStrings.priceWantAreaTitle,
          widget: [
            RangeSlider(
              values: currentRange,
              max: 100000,
              divisions: 100,
              labels: RangeLabels(
                currentRange.start.round().toString(),
                currentRange.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                viewModel.addRangeValue(values);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ShowLowAndPrice(
                  title: AppStrings.priceLowText,
                  price: viewModel.currentRangeValues.start.toInt().toString(),
                ),
                _ShowLowAndPrice(
                  title: AppStrings.priceHighText,
                  price: viewModel.currentRangeValues.end.toInt().toString(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ShowLowAndPrice extends StatelessWidget {
  const _ShowLowAndPrice({
    required this.title,
    required this.price,
  });
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyleGenerator(
          text: title,
          color: BaseTheme.expressDefaultColor,
        ),
        SizedBox(height: 4.h),
        Container(
          height: 50.h,
          width: context.getDynmaicWidth(.35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(
              color: BaseTheme.expressDefaultColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextStyleGenerator(
                text: price,
                fontSize: 18.sp,
                color: BaseTheme.expressDefaultColor,
              ),
              SizedBox(width: 22.w),
              TextStyleGenerator(
                text: AppStrings.expressCurrencyText,
                fontSize: 18.sp,
                color: BaseTheme.expressDefaultColor,
              )
            ],
          ),
        )
      ],
    );
  }
}

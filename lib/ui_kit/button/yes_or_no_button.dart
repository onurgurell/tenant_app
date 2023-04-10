import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

class YesOrNoButton extends StatelessWidget {
  const YesOrNoButton({
    super.key,
    required this.title,
    required this.buttonColor,
    required this.borderColor,
    required this.selectIndex,
    required this.onTap,
  });
  final String title;
  final Color buttonColor;
  final Color borderColor;
  final int? selectIndex;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpressYourselfViewModel>(
      builder: (context, viewModel, child) {
        return InkWell(
          onTap: onTap,
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
      },
    );
  }
}

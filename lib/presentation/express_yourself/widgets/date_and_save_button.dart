import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpressYourselfViewModel>(
      builder: (context, viewModel, child) {
        return InkWell(
          onTap: () {
            viewModel.updateDate();
            Navigator.pop(context);
          },
          child: Container(
            width: context.getDynmaicWidth(.35),
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              color: BaseTheme.expressSelectedColor,
            ),
            child: const Center(
              child: TextStyleGenerator(
                color: BaseTheme.mainWhiteColor,
                text: AppStrings.expressSaveButton,
              ),
            ),
          ),
        );
      },
    );
  }
}

class UpdateArea extends StatelessWidget {
  const UpdateArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpressYourselfViewModel>(
      builder: (context, viewModel, child) {
        return viewModel.dateTime == null
            ? const SizedBox()
            : SizedBox(
                width: context.getDynmaicWidth(.5),
                height: 20,
                child: TextStyleGenerator(
                  text: "${viewModel.dateTime} tarihinde güncellendi",
                  fontSize: 12.sp,
                  color: BaseTheme.expressDefaultColor,
                ),
              );
      },
    );
  }
}

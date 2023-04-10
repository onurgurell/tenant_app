import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/ui_kit/base_area/base_area.dart';
import 'package:tenant_app/ui_kit/button/choose_button.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

class EducationArea extends StatelessWidget {
  const EducationArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpressYourselfViewModel>(
      builder: (context, viewModel, child) {
        return BaseArea(
          title: AppStrings.eduStatusTitle,
          widget: [
            SizedBox(height: 20.h),
            ChooseButton(
              onTap: () =>
                  Navigator.of(context).pushNamed("/education_status_page"),
              title:
                  viewModel.selectedText ?? AppStrings.expressChooseHintTitle,
            ),
          ],
        );
      },
    );
  }
}

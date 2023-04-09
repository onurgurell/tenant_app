import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

class EducationStatusPage extends StatelessWidget {
  const EducationStatusPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ExpressYourselfViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: BaseTheme.mainBlackColor,
                  ),
                ),
              ),
              const _CustomChooseEducations(
                hintText: AppStrings.eduStatusDr,
              ),
              const _CustomChooseEducations(
                hintText: AppStrings.eduStatusPrimary,
              ),
              const _CustomChooseEducations(
                hintText: AppStrings.eduStatusHigh,
              ),
              const _CustomChooseEducations(
                hintText: AppStrings.eduStatusUniversity,
              )
            ],
          );
        },
      ),
    );
  }
}

class _CustomChooseEducations extends StatelessWidget {
  const _CustomChooseEducations({required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.getDynmaicWidth(.9),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Provider.of<ExpressYourselfViewModel>(context, listen: false)
                    .updateText(hintText);
                Navigator.pop(context);
              },
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: hintText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

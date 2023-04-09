import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/presentation/express_yourself/widgets/date_and_save_button.dart';
import 'package:tenant_app/presentation/express_yourself/widgets/education_area.dart';
import 'package:tenant_app/presentation/express_yourself/widgets/explain_yourself_area.dart';
import 'package:tenant_app/presentation/express_yourself/widgets/gender_area.dart';
import 'package:tenant_app/presentation/express_yourself/widgets/income_area.dart';
import 'package:tenant_app/presentation/express_yourself/widgets/pet_area.dart';
import 'package:tenant_app/presentation/express_yourself/widgets/price_range_area.dart';
import 'package:tenant_app/presentation/express_yourself/widgets/profil_area.dart';
import 'package:tenant_app/presentation/express_yourself/widgets/salary_or_rent_area.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';

class ExpressYourSelfPage extends StatelessWidget {
  const ExpressYourSelfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const _AppBarBackIcon(),
        title: const _AppBarTitle(),
        backgroundColor: BaseTheme.mainWhiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(thickness: 2),
              const ProfilArea(),
              SizedBox(height: 45.h),
              const GenderArea(),
              const PetArea(),
              const EducationArea(),
              SizedBox(height: 45.h),
              const SalaryOrRentArea(
                title: AppStrings.salaryMonthlyTitle,
                hintText: AppStrings.salaryHintText,
              ),
              SizedBox(height: 45.h),
              const IncomeArea(),
              SizedBox(height: 40.h),
              const SalaryOrRentArea(
                title: AppStrings.rentCurrentAmountTitle,
                hintText: AppStrings.rentCurrentHintText,
              ),
              SizedBox(height: 45.h),
              const PriceRangeArea(),
              SizedBox(height: 45.h),
              const ExplainYourSelfArea(),
              SizedBox(height: 10.h),
              const UpdateArea(),
              SizedBox(height: 20.h),
              const SaveButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return TextStyleGenerator(
      text: AppStrings.expressAppBarTitle,
      color: BaseTheme.profilAppBarColor,
      fontSize: 22.sp,
    );
  }
}

class _AppBarBackIcon extends StatelessWidget {
  const _AppBarBackIcon();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );
  }
}

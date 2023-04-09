import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

class ProfilArea extends StatelessWidget {
  const ProfilArea({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpressYourselfViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: viewModel.image == null
                        ? BaseTheme.expressDefaultColor
                        : BaseTheme.expressSelectedButtonColor,
                    borderRadius: BorderRadius.circular(20.h),
                  ),
                ),
                viewModel.isLoading
                    ? const CircularProgressIndicator()
                    : Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: BaseTheme.profilBackgroundColor,
                          borderRadius: BorderRadius.circular(100.h),
                        ),
                        child: viewModel.image == null
                            ? Icon(Icons.person,
                                size: 40,
                                color: BaseTheme.mainWhiteColorWithOpacity)
                            : CircleAvatar(
                                backgroundImage: FileImage(viewModel.image!),
                              ),
                      ),
                viewModel.image == null
                    ? const SizedBox()
                    : Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: BaseTheme.expressDefaultColor,
                            borderRadius: BorderRadius.circular(4.sp),
                          ),
                          child: Center(
                              child: InkWell(
                            onTap: () => viewModel.deleteImage(),
                            child: Icon(
                              Icons.delete,
                              size: 16.sp,
                              color: BaseTheme.mainWhiteColor,
                            ),
                          )),
                        ),
                      )
              ],
            ),
            SizedBox(height: 20.h),
            TextStyleGenerator(
              text: AppStrings.profilImageTitle,
              fontSize: 18.sp,
            ),
            SizedBox(height: 12.h),
            TextStyleGenerator(
              text: AppStrings.profilDescription,
              fontSize: 18.sp,
              color: BaseTheme.expressDefaultColor,
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                viewModel.getImage();
              },
              child: Container(
                width: viewModel.image == null
                    ? 100.w
                    : context.getDynmaicWidth(.9),
                height: 50.h,
                decoration: BoxDecoration(
                    color: BaseTheme.mainWhiteColor,
                    borderRadius: BorderRadius.circular(12.sp),
                    border: Border.all(color: BaseTheme.expressSelectedColor)),
                child: viewModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                        child: TextStyleGenerator(
                          text: viewModel.image == null
                              ? AppStrings.profilAddButtonText
                              : AppStrings.profilChangeButton,
                          color: BaseTheme.expressSelectedButtonColor,
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}

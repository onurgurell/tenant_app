import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenant_app/core/theme/theme.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  late bool isChoose = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChoose = !isChoose;
        });
      },
      child: Container(
        width: context.getDynmaicWidth(.9),
        height: 50.h,
        decoration: BoxDecoration(
          color: isChoose
              ? BaseTheme.expressSelectedButtonColor
              : BaseTheme.mainWhiteColor,
          border: Border.all(
            color: isChoose
                ? BaseTheme.expressSelectedColor
                : BaseTheme.expressNotSelectedBorderColor,
          ),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Center(
          child: TextStyleGenerator(
            text: widget.title,
          ),
        ),
      ),
    );
  }
}

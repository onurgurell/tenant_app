import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenant_app/extensions/context_extension.dart';
import 'package:tenant_app/ui_kit/text/text_withgooglefonts.dart';

class BaseArea extends StatelessWidget {
  const BaseArea({
    super.key,
    required this.title,
    required this.widget,
  });
  final String title;
  final List<Widget> widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: context.getDynmaicWidth(.6),
          child: TextStyleGenerator(
            text: title,
            fontSize: 18.sp,
          ),
        ),
        ...widget
      ],
    );
  }
}

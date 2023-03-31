import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/colors.dart';
import '../../../components/edit_text_widget.dart';

class CustomEditText extends StatelessWidget {
  String? img;
  IconData? icon;
  String label;
  CustomEditText({
    super.key,
    required this.label,
    this.img,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return EditTextWidget(
      label: label,
      prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(width: 8.w),
        icon != null
            ? Icon(
                icon!,
                color: borderMainColor,
                size: 24.w,
              )
            : Image.asset(
                img ?? "assets/icons/profile-circle.png",
                width: 24.w,
                height: 24.h,
                fit: BoxFit.contain,
              ),
        SizedBox(width: 8.w),
        Container(
          height: 8.h,
          width: 2.w,
          color: borderMainColor,
        ),
        SizedBox(width: 8.w),
      ]),
    );
  }
}

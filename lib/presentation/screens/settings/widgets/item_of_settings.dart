import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/colors.dart';
import '../../../components/text_widget.dart';

class ItemOfSettings extends StatelessWidget {
  final String img;
  final String title;
  const ItemOfSettings({
    super.key,
    required this.img,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.r),
          color: borderMainColor,
        ),
        child: Image.asset(
          img,
          width: 30.w,
          height: 30.w,
          fit: BoxFit.contain,
        ),
      ),
      title: TextWidget(
        title: title,
        fontSize: 16.sp,
        color: Colors.black,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: mauveColor,
        size: 16.0.w,
      ),
    );
  }
}

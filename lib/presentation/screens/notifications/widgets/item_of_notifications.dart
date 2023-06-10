import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/text_widget.dart';

class ItemOfNotifications extends StatelessWidget {
  final String title;
  const ItemOfNotifications({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0.w),
      child: Row(children: [
        Image.asset(
          "assets/images/notifications.png",
          width: 40.w,
          height: 40.w,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: TextWidget(
            title: title,
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.start,
            color: Colors.black,
          ),
        )
      ]),
    );
  }
}

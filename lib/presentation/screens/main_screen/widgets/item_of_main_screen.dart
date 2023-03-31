import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/text_widget.dart';

class ItemOfMainScreen extends StatelessWidget {
  List<Color> colors;
  String backImg;
  String icon;
  String title;
  String subTitle;
  ItemOfMainScreen({
    super.key,
    required this.colors,
    required this.backImg,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.r),
        gradient: LinearGradient(colors: colors),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              const Spacer(),
              Image.asset(
                backImg,
                width: 65.w,
                height: 65.w,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 32.w),
            ],
          ),
          Row(children: [
            SizedBox(
              width: 32.w,
            ),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: Colors.white,
              ),
              child: Image.asset(
                icon,
                width: 26.w,
                height: 26.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      title: title,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8.w),
                    TextWidget(
                      title: subTitle,
                      fontSize: 10.sp,
                      color: Colors.white,
                    )
                  ]),
            ),
            Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16.w,
              color: Colors.white,
            ),
            SizedBox(width: 36.w),
          ])
        ],
      ),
    );
  }
}

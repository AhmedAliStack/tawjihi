import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../core/values/colors.dart';
import '../../../components/text_widget.dart';

class AchievementsCard extends StatelessWidget {
  String title;
  String subTitle;
  String? questions;
  bool headerCard;
  AchievementsCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.questions,
    this.headerCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: const LinearGradient(colors: gradientButton),
            ),
            child: Image.asset(
              'assets/icons/cup_icon.png',
              width: 30.w,
              height: 30.w,
              fit: BoxFit.fill,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              headerCard
                  ? GradientText(title,
                      style: TextStyle(
                          fontSize: 14.0.sp, fontWeight: FontWeight.w500),
                      colors: gradientButton)
                  : TextWidget(
                      title: title,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: header,
                    ),
              SizedBox(height: 8.h),
              TextWidget(
                title: subTitle,
                fontSize: headerCard ? 10.sp : 12.sp,
                fontWeight: headerCard ? FontWeight.w300 : FontWeight.w500,
                color: header,
              ),
              SizedBox(height: 8.h),
              questions != null
                  ? TextWidget(
                      title: questions,
                      fontSize: 12.sp,
                      color: secondaryColor,
                    )
                  : const SizedBox()
            ]),
          ),
          CircularPercentIndicator(
            radius: headerCard ? 40.0 : 35.0,
            lineWidth: 6.0,
            animation: true,
            percent: 0.5,
            backgroundWidth: 4.0,
            center: Text("45%"),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: borderMainColor,
            rotateLinearGradient: true,
            linearGradient: LinearGradient(colors: gradientButton),
          ),
        ],
      ),
    );
  }
}

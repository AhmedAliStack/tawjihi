import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../core/values/colors.dart';
import '../../../components/text_widget.dart';

class AchievementsCard extends StatelessWidget {
  final String subject;
  final String teacherName;
  final int? questionTotal;
  final int? questionResult;
  final num? percentHeaderCard;
  final int? percentCard;
  final bool headerCard;
  const AchievementsCard({
    super.key,
    required this.subject,
    required this.teacherName,
    required this.questionTotal,
    required this.questionResult,
    this.headerCard = false,
    required this.percentHeaderCard,
    required this.percentCard,
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
                  ? GradientText(subject,
                      style: TextStyle(
                          fontSize: 14.0.sp, fontWeight: FontWeight.w500),
                      colors: gradientButton)
                  : TextWidget(
                      title: subject,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: header,
                    ),
              SizedBox(height: 8.h),
              TextWidget(
                title: teacherName,
                fontSize: headerCard ? 12.sp : 14.sp,
                fontWeight: headerCard ? FontWeight.w300 : FontWeight.w500,
                color: header,
              ),
              SizedBox(height: 8.h),
              questionTotal != null && questionResult != null
                  ? TextWidget(
                      title: '$questionTotal/$questionResult سؤال',
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
            percent: percentHeaderCard != null
                ? percentHeaderCard! / 100
                : percentCard != null
                    ? percentCard! / 100
                    : 0,
            backgroundWidth: 4.0,
            center: Text(
                "${percentHeaderCard != null ? percentHeaderCard.toString() : percentCard} %"),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: borderMainColor,
            rotateLinearGradient: true,
            linearGradient: const LinearGradient(colors: gradientButton),
          ),
        ],
      ),
    );
  }
}

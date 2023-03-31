import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../core/values/colors.dart';
import '../../../components/text_widget.dart';

class ItemOfDetails extends StatelessWidget {
  ItemOfDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: borderMainColor,
        ),
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(colors: gradientButton),
                ),
                child: TextWidget(
                  title: "1",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            title: "نتيجة اختبار الوحدة الاولى",
                            fontWeight: FontWeight.w500,
                            color: secondaryColor,
                          ),
                          TextWidget(title: "99%", fontWeight: FontWeight.w500),
                        ]),
                    SizedBox(height: 8.h),
                    RotatedBox(
                      quarterTurns: 2,
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        percent: 0.5,
                        animation: true,
                        barRadius: Radius.circular(40.r),
                        linearGradient:
                            const LinearGradient(colors: gradientButton),
                      ),
                    )
                  ]),
            ),
          ],
        ));
  }
}

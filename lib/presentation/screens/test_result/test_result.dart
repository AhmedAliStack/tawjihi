import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/button_widget.dart';
import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../unit_test/unit_test.dart';

class TestResult extends StatelessWidget {
  const TestResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.w, top: 32.h, end: 16.w, bottom: 32.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Utils.backWidget(context, authScreensBack: true),
                TextWidget(
                  title: "نتيجة الاختبار",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                SizedBox(width: 32.w),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 16.w),
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: containerColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 6.0,
                  animation: true,
                  percent: 0.5,
                  backgroundWidth: 4.0,
                  center: const Text(
                    "95/100",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  circularStrokeCap: CircularStrokeCap.square,
                  backgroundColor: borderMainColor,
                  rotateLinearGradient: true,
                  linearGradient: const LinearGradient(colors: gradientButton),
                ),
                SizedBox(width: 16.w),
                Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: "اجابابات صحيحة : 8",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff93D774),
                        ),
                        SizedBox(height: 8.h),
                        TextWidget(
                          title: "اجابة خاطئة : 2",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffD40E0E),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          Image.asset(
            "assets/images/test_result.png",
            width: 170.w,
            height: 160.w,
          ),
          SizedBox(height: 32.w),
          TextWidget(
            title: "تم انهاء الاختبار بنجاح",
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: ButtonWidget(
                onTap: () {},
                child: TextWidget(
                  title: "اختبارات المادة",
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )),
              SizedBox(width: 16.w),
              Expanded(
                child: ButtonWidget(
                  onTap: () => Utils.openScreen(context, const UnitTest()),
                  backgroundButtonColor: borderMainColor,
                  child: const TextWidget(
                    title: "مراجعة الاختبار",
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6D6D6D),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

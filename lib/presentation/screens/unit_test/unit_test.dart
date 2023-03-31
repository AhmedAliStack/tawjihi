import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/button_widget.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../test_result/test_result.dart';
import 'widgets/item_of_unit_test.dart';

class UnitTest extends StatelessWidget {
  const UnitTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
        body: Stack(children: [
      Image.asset(
        "assets/images/question_icons.png",
      ),
      SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.w, top: 32.h, end: 16.w, bottom: 32.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Utils.backWidget(context, authScreensBack: true),
                TextWidget(
                  title: "اختبار الوحده الاولى",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                SizedBox(width: 32.w),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: borderMainColor, shape: BoxShape.circle),
            child: CircularPercentIndicator(
              radius: 40.0,
              lineWidth: 6.0,
              animation: true,
              percent: 0.5,
              backgroundWidth: 4.0,
              center: Text("03:25",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500)),
              circularStrokeCap: CircularStrokeCap.square,
              backgroundColor: borderMainColor,
              rotateLinearGradient: true,
              linearGradient: LinearGradient(colors: gradientButton),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          TextWidget(
            title: "ماهى عاصمة جمهورية مصر العربية؟",
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.h,
          ),
          TextWidget(
            title: "اجابة صحيحة",
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xff93D774),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ItemOfUnitTest(correct: true, title: "القاهرة"),
          ItemOfUnitTest(title: "الدقهلية"),
          ItemOfUnitTest(title: "المنوفية"),
          ItemOfUnitTest(title: "الشرقية"),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                title: "السؤال",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xffA647A4),
                textAlign: TextAlign.center,
              ),
              SizedBox(width: 4.w),
              TextWidget(
                title: "1/30",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 32.h),
            child: Row(children: [
              Expanded(
                  child: ButtonWidget(
                height: 50.w,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 25.w,
                  ),
                  SizedBox(width: 4.w),
                  TextWidget(
                    title: "السابق",
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )
                ]),
              )),
              SizedBox(width: 16.w),
              Expanded(
                child: ButtonWidget(
                  onTap: () => Utils.openScreen(context, TestResult()),
                  height: 50.w,
                  backgroundButtonColor: borderMainColor,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          title: "التالى",
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff6D6D6D),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 25.w,
                        ),
                      ]),
                ),
              ),
            ]),
          ),
        ]),
      ),
    ]));
  }
}

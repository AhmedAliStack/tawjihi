import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';

import '../../../core/utils/utils.dart';
import '../achievements/achievements.dart';
import '../most_distinguished/most_distinguished.dart';
import '../my_tests/my_tests.dart';
import '../subjects/subjects.dart';
import 'widgets/item_of_main_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 24.0.w, end: 24.0.w, top: 64.w, bottom: 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/profile_img.png',
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                          title: "مرحبا بك .. !", color: secondaryColor),
                      SizedBox(height: 16.w),
                      Row(
                        children: [
                          TextWidget(
                            title: "محمد ابراهيم",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8.w),
                          Image.asset(
                            "assets/icons/waving_hand.png",
                            width: 24.w,
                            height: 24.w,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 32.h),
              TextWidget(
                title: "الرئيسية",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 32.w),
              GestureDetector(
                onTap: () => Utils.openScreen(context, const Achievements()),
                child: ItemOfMainScreen(
                  title: "انجازاتك",
                  subTitle: "شرح بسيط يكتب هنا يدل على العبارة",
                  icon: "assets/icons/cup_icon.png",
                  backImg: "assets/images/cup.png",
                  colors: const [Color(0xff2DD9DF), Color(0xff00A6AC)],
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () =>
                    Utils.openScreen(context, const MostDistinguished()),
                child: ItemOfMainScreen(
                  title: "الاكثر تميزا",
                  subTitle: "شرح بسيط يكتب هنا يدل على العبارة",
                  icon: "assets/icons/crown_icon.png",
                  backImg: "assets/images/crown_img.png",
                  colors: const [Color(0xff7CDE4F), Color(0xff316A16)],
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () => Utils.openScreen(context, const Subjects()),
                child: ItemOfMainScreen(
                  title: "المواد الدراسية",
                  subTitle: "شرح بسيط يكتب هنا يدل على العبارة",
                  icon: "assets/icons/book_icon.png",
                  backImg: "assets/images/book_img.png",
                  colors: const [Color(0xffA52C00), Color(0xffEA4F16)],
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () => Utils.openScreen(context, const MyTests()),
                child: ItemOfMainScreen(
                  title: "اختباراتى",
                  subTitle: "شرح بسيط يكتب هنا يدل على العبارة",
                  icon: "assets/icons/question_icon.png",
                  backImg: "assets/images/question_img.png",
                  colors: const [Color(0xffCCA4FA), Color(0xffA647A4)],
                ),
              ),
              SizedBox(height: 16.w),
            ]),
          ),
        ],
      ),
    );
  }
}

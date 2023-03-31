import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/screens/achievements/widgets/achievements_card.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';

import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../achievements_details/achievements_details.dart';

class Achievements extends StatelessWidget {
  const Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: containerColor,
        child: Stack(children: [
          Container(
            height: 0.3.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20.r), right: Radius.circular(20.r)),
              gradient: const LinearGradient(colors: gradientButton),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Utils.backWidget(context),
                  TextWidget(
                    title: "انجازاتى",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  SizedBox(width: 32.w),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.2.sh, left: 16.w, right: 16.w),
            child: Column(children: [
              AchievementsCard(
                headerCard: true,
                title: "نسبة الانجاز العامة",
                subTitle: "مستوى منخفض",
              ),
              Expanded(
                  child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Utils.openScreen(context, const AchievementsDetails());
                  },
                  child: AchievementsCard(
                    title: "مادة الرياضيات",
                    subTitle: "ا/ ايمن محبوب (الاول الاعدادى)",
                    questions: "28/35 سؤال",
                  ),
                ),
                itemCount: 10,
              ))
            ]),
          )
        ]),
      ),
    );
  }
}

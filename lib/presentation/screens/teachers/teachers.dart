import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/screens/teachers/widgets/item_of_teachers.dart';
import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../teacher_info/teacher_info.dart';

class Teachers extends StatelessWidget {
  const Teachers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 0.3.sw,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffF8F8F8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 16.w, top: 16.h, end: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Utils.backWidget(context, authScreensBack: true),
                    TextWidget(
                      title: "اختباراتى",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    SizedBox(width: 32.w),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(16.w),
                separatorBuilder: (context, index) => SizedBox(height: 8.w),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () =>
                          Utils.openScreen(context, const Teacherinfo()),
                      child: ItemOfTeachers());
                },
                itemCount: 10,
              ),
            ),
          ],
        ));
  }
}

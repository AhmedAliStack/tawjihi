// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tawjihi_quiz/domain/models/my_teachers_model.dart';

import '../../../../core/values/colors.dart';
import '../../../components/text_widget.dart';

class ItemOfTeachers extends StatelessWidget {
  final Color? cardColor;
  final Data cardData;
  const ItemOfTeachers({
    Key? key,
    this.cardColor,
    required this.cardData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: cardColor ?? const Color(0xffF8F8F8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.network(
          "",
          width: 70.w,
          height: 70.w,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            'assets/images/teacher.png',
            width: 70.w,
            height: 70.w,
            fit: BoxFit.contain,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              title: cardData.name,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff444444),
            ),
            SizedBox(height: 8.w),
            Row(
              children: [
                Flexible(
                  child: TextWidget(
                    title: cardData.subject,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff444444).withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 4.w),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.r),
                        color: borderMainColor),
                    child: Row(children: [
                      TextWidget(
                        title: cardData.rate.toString(),
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                      SizedBox(width: 4.w),
                      const Icon(Icons.star_rounded, color: Color(0xffFB966E)),
                    ]))
              ],
            ),
            SizedBox(height: 8.w),
            TextWidget(
                title: "عدد الاختبارات : ${cardData.examsCount}",
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: mauveColor),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward,
          color: mauveColor,
        ),
      ),
    );
  }
}

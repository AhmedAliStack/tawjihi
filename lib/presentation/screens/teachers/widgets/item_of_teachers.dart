// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/colors.dart';
import '../../../components/text_widget.dart';

class ItemOfTeachers extends StatelessWidget {
  Color? card;
  ItemOfTeachers({
    Key? key,
    this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: card ?? const Color(0xffF8F8F8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(
          'assets/images/teacher.png',
          width: 70.w,
          height: 70.w,
          fit: BoxFit.contain,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              title: "أ / محمد عبد العال",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff444444),
            ),
            SizedBox(height: 8.w),
            Row(
              children: [
                Flexible(
                  child: TextWidget(
                    title: "الرياضيات",
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
                        title: "4.5",
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
                title: "عدد الاختبارات : 5",
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

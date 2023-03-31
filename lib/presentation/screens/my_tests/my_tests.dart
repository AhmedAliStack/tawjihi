import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/text_widget.dart';
import '../achievements_details/achievements_details.dart';

class MyTests extends StatelessWidget {
  const MyTests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 0.4.sw,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
                gradient: LinearGradient(colors: gradientButton)),
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w, top: 16.h),
              child: Row(
                children: [
                  Utils.backWidget(context),
                  SizedBox(
                    width: 32.w,
                  ),
                  TextWidget(
                    title: "اختباراتى",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )
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
                  onTap: () => Utils.openScreen(context, AchievementsDetails()),
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: borderMainColor,
                        ),
                        child: Image.asset(
                          'assets/icons/my_tests.png',
                          width: 30.w,
                          height: 30.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: TextWidget(
                        title: "اختبار الرياضيات",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: mauveColor,
                      ),
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/text_widget.dart';
import '../unit_test/unit_test.dart';

class TeacherTests extends StatelessWidget {
  const TeacherTests({super.key});

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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Utils.backWidget(context),
                  SizedBox(
                    width: 26.w,
                  ),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: TextWidget(
                                title: "ا/ عبير صالح",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    color: Colors.white),
                                child: Row(children: [
                                  GradientText("4.5",
                                      style: TextStyle(
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      colors: gradientButton),
                                  SizedBox(width: 4.w),
                                  const Icon(Icons.star_rounded,
                                      color: Color(0xffFB966E)),
                                ]))
                          ],
                        ),
                        SizedBox(height: 8.h),
                        TextWidget(
                            title: " (الاول الاعدادى)",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)
                      ])
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
                  onTap: () => Utils.openScreen(context, const UnitTest()),
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
                        title: "اختبارالوحدة الاولى",
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

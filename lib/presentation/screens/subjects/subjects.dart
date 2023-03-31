import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/text_widget.dart';
import '../subject_details/subject_details.dart';

class Subjects extends StatelessWidget {
  const Subjects({super.key});

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
                    title: "المواد الدراسية",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      Utils.openScreen(context, const SubjectDetails()),
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: borderMainColor)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
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
                          SizedBox(height: 16.h),
                          TextWidget(
                              title: "الرياضيات",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ]),
                  ),
                );
              },
              itemCount: 20,
            ),
          )),
        ],
      ),
    );
  }
}

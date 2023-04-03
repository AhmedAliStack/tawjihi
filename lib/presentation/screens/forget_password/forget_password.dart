import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';

import '../../../core/values/colors.dart';
import '../../components/button_widget.dart';
import '../../components/edit_text_widget.dart';
import '../base/base_stateless.dart';
import '../forget_pass_otp/forget_pass_otp.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                    top: 32.h, left: 16.w, right: 16.w, bottom: 16.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utils.backWidget(context, authScreensBack: true),
                      SizedBox(height: 32.h),
                      TextWidget(
                          title: "استعادة",
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 8.h),
                      TextWidget(
                          title: "كلمة المرور",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                      SizedBox(height: 8.h),
                      Container(
                          width: 40.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: gradientButton,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(26.r)),
                          )),
                      SizedBox(height: 32.h),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/forget_password_img.png",
                          width: 180.w,
                          height: 219.w,
                          alignment: AlignmentDirectional.center,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: TextWidget(
                          title:
                              "رجاء، قم بإدخال البريد الالكتروني الخاص بك وسيتم إرسال رسالة بكود التفعيل",
                          color: const Color(0xff36476A),
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 32.w),
                      EditTextWidget(
                        label: "البريد الالكتروني",
                        prefixIcon:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.email_outlined,
                            color: borderMainColor,
                            size: 24.w,
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            height: 8.h,
                            width: 2.w,
                            color: borderMainColor,
                          ),
                          SizedBox(width: 8.w),
                        ]),
                      ),
                      SizedBox(height: 32.h),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 180.w,
                          height: 50.w,
                          child: ButtonWidget(
                            onTap: () =>
                                Utils.openScreen(context, ForgetPassOtp()),
                            title: "ارسال",
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                    ]))));
  }
}

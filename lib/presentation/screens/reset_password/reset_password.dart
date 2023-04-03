// because Directionality of otp ltr agnoire with tr() method i use as tr
import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/button_widget.dart';
import '../../../core/utils/utils.dart';
import '../../components/edit_text_widget.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Utils.backWidget(context, authScreensBack: true)),
              SizedBox(height: 32.h),
              Image.asset(
                "assets/images/reset_pass.png",
                width: 175.w,
                height: 160.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 16.h),
              TextWidget(
                title: "تغير كلمة المرور",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.h),
              TextWidget(
                title: "قم بكتابة الرقم السري الجديد مرتين واضغط تأكيد ",
                color: secondaryColor,
              ),
              SizedBox(height: 32.h),
              EditTextWidget(
                label: "الرقم السري الجديد",
                password: true,
                prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(width: 8.w),
                  Image.asset(
                    "assets/icons/lock.png",
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.contain,
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
              SizedBox(height: 16.h),
              EditTextWidget(
                label: "الرقم السري مرة اخرى",
                password: true,
                prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(width: 8.w),
                  Image.asset(
                    "assets/icons/lock.png",
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.contain,
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
              SizedBox(height: 64.h),
              SizedBox(
                width: 180.w,
                height: 50.w,
                child: ButtonWidget(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 25.w,
                        ),
                        SizedBox(width: 4.w),
                        TextWidget(
                          title: "تأكيد",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )
                      ]),
                  onTap: () {
                    Utils.successDialog(
                            context: context,
                            title: "تم تغير كلمة المرور بنجاح",
                            screen: const LoginScreen())
                        .then((value) =>
                            Utils.openScreen(context, const LoginScreen()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

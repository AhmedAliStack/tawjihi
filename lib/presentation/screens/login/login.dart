import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/edit_text_widget.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';
import '../../../core/utils/utils.dart';
import '../../components/button_widget.dart';
import '../base/base_stateless.dart';
import '../forget_password/forget_password.dart';
import '../home_layout/home.dart';
import '../sign_up/sign_up.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
        body: SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(top: 64.h, left: 16.w, right: 16.w, bottom: 16.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            "assets/images/logo.png",
            width: 100.w,
            height: 80.w,
            alignment: AlignmentDirectional.topStart,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 32.h),
          TextWidget(
            title: "مرحبا , بعودتك".tr(),
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 8.h),
          TextWidget(
            title: "قم بتسجيل الدخول حتي يمكنك تصفح التطبيق".tr(),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 32.h),
          EditTextWidget(
            label: "الهاتف الجوال",
          ),
          SizedBox(height: 8.h),
          EditTextWidget(
            label: "رقم المرور ",
          ),
          SizedBox(height: 32.h),
          Row(children: [
            Transform.scale(
              scale: 1.3.w,
              child: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: const Color(0xffCBD5E1),
                ),
                child: Checkbox(
                  value: false,
                  onChanged: (value) {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.r)),
                ),
              ),
            ),
            const TextWidget(
              title: "تذكرني",
              color: secondaryColor,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Utils.openScreen(context, const Forgetpassword()),
              child: const TextWidget(
                title: "نسيت كلمة المرور ؟",
                color: mauveColor,
              ),
            )
          ]),
          SizedBox(height: 32.h),
          ButtonWidget(
            onTap: () => Utils.openScreen(context, Home()),
            title: "دخول",
          ),
          SizedBox(height: 32.h),
          Row(
            children: [
              const Expanded(
                child: Divider(
                  color: borderMainColor,
                  thickness: 1,
                ),
              ),
              SizedBox(width: 8.w),
              const TextWidget(
                title: " أو عبر",
              ),
              SizedBox(width: 8.w),
              const Expanded(
                child: Divider(
                  color: borderMainColor,
                  thickness: 1,
                ),
              ),
            ],
          ),
          SizedBox(height: 26.w),
          ButtonWidget(
            backgroundButtonColor: Colors.white,
            withBorder: true,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: Image.asset(
                  "assets/icons/google_icon.png",
                  width: 24.w,
                  height: 24.w,
                  alignment: AlignmentDirectional.center,
                  fit: BoxFit.contain,
                ),
              ),
              const Expanded(
                flex: 2,
                child: TextWidget(
                  title: "دخول عبر جوجل",
                  textAlign: TextAlign.start,
                ),
              ),
            ]),
          ),
          SizedBox(height: 32.h),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => Utils.openScreen(context, const SignUp()),
              child: RichText(
                  text: TextSpan(
                      text: "ليس لديك حساب ؟ ",
                      style: TextStyle(
                          fontFamily: 'Bahij',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: secondaryColor),
                      children: [
                    TextSpan(
                      text: "تسجيل حساب",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff3935E7)),
                    ),
                  ])),
            ),
          ),
          SizedBox(height: 16.h),
        ]),
      ),
    ));
  }
}

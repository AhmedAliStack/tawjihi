// because Directionality of otp ltr agnoire with tr() method i use as tr
import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/button_widget.dart';
import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../reset_password/reset_password.dart';

class ForgetPassOtp extends StatelessWidget {
  const ForgetPassOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.only(start: 16.w, top: 32.h),
                      child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child:
                              Utils.backWidget(context, authScreensBack: true)),
                    ),
                    SizedBox(height: 32.h),
                    Image.asset(
                      "assets/images/otp.png",
                      width: 175.w,
                      height: 160.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 16.h),
                    TextWidget(
                      title: "كود تغير كلمة المرور",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 8.h),
                    TextWidget(
                      title: "قم بإدخال الكود المكون من اربع ارقام",
                      fontWeight: FontWeight.w500,
                      color: secondaryColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 64.0.w, vertical: 32.h),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(
                          backgroundColor: Colors.white,
                          appContext: context,
                          length: 4,
                          animationType: AnimationType.fade,
                          validator: (v) {},
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            fieldHeight: 60.w,
                            fieldWidth: 50.w,
                            borderRadius: BorderRadius.circular(8.0.r),
                            activeFillColor: borderMainColor,
                            activeColor: mauveColor,
                            selectedColor: yellow,
                            inactiveFillColor: borderMainColor,
                            inactiveColor: borderMainColor,
                            selectedFillColor: borderMainColor,
                          ),
                          cursorColor: secondaryColor,
                          errorTextSpace: 25,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          keyboardType: TextInputType.number,
                          textStyle: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          onCompleted: (v) {
                            // cubit.otpCode = v;
                            // checkOtp(cubit, v, context);
                          },
                          onChanged: (_) {},
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(16.0.w),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(22.r)),
                    //     color: borderMainColor,
                    //   ),
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         TextWidget(
                    //           title: "02:00",
                    //           fontSize: 12.sp,
                    //           color: Colors.black,
                    //         ),
                    //         SizedBox(width: 8.w),
                    //         Image.asset(
                    //           "assets/icons/timer.png",
                    //           width: 18.w,
                    //           height: 18.w,
                    //           fit: BoxFit.contain,
                    //         )
                    //       ]),
                    // )
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: ButtonWidget(
                onTap: () => Utils.openScreen(context, const ResetPassword()),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              )),
              SizedBox(width: 16.w),
              Expanded(
                child: ButtonWidget(
                  backgroundButtonColor: borderMainColor,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/resend.png",
                          width: 20.w,
                          height: 20.w,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 4.w),
                        TextWidget(
                          title: "إعادة الإرسال",
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff6D6D6D),
                        )
                      ]),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

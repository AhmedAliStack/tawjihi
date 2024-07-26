// because Directionality of otp ltr agnoire with tr() method i use as tr
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/utils/validation.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/button_widget.dart';
import 'package:tawjihi_quiz/presentation/screens/forget_password/cubit/forget_password_cubit.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
import '../../../core/utils/utils.dart';
import '../../../services_locator.dart';
import '../../components/edit_text_widget.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is SuccessSendpasswordState) {
          Utils.successDialog(
                  context: context,
                  title: LocaleKeys.pass_saved,
                  screen: LoginScreen())
              .then((value) => Utils.openScreen(context, LoginScreen()));
        }
      },
      builder: (context, state) {
        final cubit = ForgetPasswordCubit.get(context);
        return BaseStateless(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 32.h),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: AlignmentDirectional.topStart,
                        child:
                            Utils.backWidget(context, authScreensBack: true)),
                    SizedBox(height: 32.h),
                    Image.asset(
                      "assets/images/reset_pass.png",
                      width: 175.w,
                      height: 160.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 16.h),
                    TextWidget(
                      title: LocaleKeys.change_pass,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 8.h),
                    const TextWidget(
                      title: LocaleKeys.confirm_pass_msg,
                      color: secondaryColor,
                    ),
                    SizedBox(height: 32.h),
                    EditTextWidget(
                      controller: cubit.password,
                      label: LocaleKeys.new_pass,
                      password: true,
                      prefixIcon:
                          Row(mainAxisSize: MainAxisSize.min, children: [
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
                      validator: locator<Validation>().validatePassword,
                    ),
                    SizedBox(height: 16.h),
                    EditTextWidget(
                      controller: cubit.confirmPassword,
                      label: LocaleKeys.again_new_pass,
                      password: true,
                      prefixIcon:
                          Row(mainAxisSize: MainAxisSize.min, children: [
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
                      validator: (p) {
                        return locator<Validation>()
                            .confirmPasswordValidation(p, cubit.password.text);
                      },
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
                              const TextWidget(
                                title: LocaleKeys.confirm,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              )
                            ]),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            cubit.resetPassword();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

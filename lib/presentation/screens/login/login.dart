import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';
import 'package:tawjihi_quiz/presentation/screens/home_layout/home.dart';
import 'package:tawjihi_quiz/presentation/screens/login/cubit/login_cubit.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
import '../../../core/utils/utils.dart';
import '../../../core/utils/validation.dart';
import '../../../services_locator.dart';
import '../../components/alerts.dart';
import '../../components/button_widget.dart';
import '../base/base_stateless.dart';
import '../forget_password/forget_password.dart';
import '../sign_up/sign_up.dart';
import '../sign_up/widgets/custom_edit_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
        body: BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            Utils.openScreen(context, const Home(), remove: true);
          }
          if (state is ErrorLoginState) {
            OverLays.toast(text: state.error);
          }
        },
        builder: (context, state) {
          final cubit = LoginCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 64.h, left: 16.w, right: 16.w, bottom: 16.h),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 100.w,
                        height: 80.w,
                        alignment: AlignmentDirectional.topStart,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 32.h),
                      TextWidget(
                        title: LocaleKeys.welcome.tr(),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 8.h),
                      TextWidget(
                        title: LocaleKeys.login_msg.tr(),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 32.h),
                      CustomEditText(
                        icon: Icons.phone_outlined,
                        label: LocaleKeys.phone.tr(),
                        controller: cubit.phoneControler,
                        type: TextInputType.phone,
                        validator: locator<Validation>().defaultValidation,
                      ),
                      SizedBox(height: 8.h),
                      CustomEditText(
                        img: "assets/icons/lock.png",
                        label: LocaleKeys.password.tr(),
                        controller: cubit.passwordController,
                        type: TextInputType.visiblePassword,
                        isPassword: true,

                        // validator: locator<Validation>().validatePassword,
                      ),
                      SizedBox(height: 32.h),
                      Row(children: [
                        // Transform.scale(
                        //   scale: 1.3.w,
                        //   child: Theme(
                        //     data: Theme.of(context).copyWith(
                        //       unselectedWidgetColor: const Color(0xffCBD5E1),
                        //     ),
                        //     child: Checkbox(
                        //       value: cubit.checkBox,
                        //       onChanged: (value) {
                        //         cubit.changeCheckBox(value!);
                        //       },
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(3.r)),
                        //     ),
                        //   ),
                        // ),
                        // const TextWidget(
                        //   title: "تذكرني",
                        //   color: secondaryColor,
                        // ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () =>
                              Utils.openScreen(context, Forgetpassword()),
                          child: TextWidget(
                            title: LocaleKeys.forget_pass.tr(),
                            color: mauveColor,
                          ),
                        )
                      ]),
                      SizedBox(height: 32.h),
                      ButtonWidget(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            // if (!cubit.checkBox) {
                            //   OverLays.toast(
                            //       text: "يجب الموافقة على الشروط والأحكام");
                            //   return;
                            // }
                            cubit.login();
                          }
                        },
                        title: LocaleKeys.enter.tr(),
                      ),
                      SizedBox(height: 16.h),
                      // Row(
                      //   children: [
                      //     const Expanded(
                      //       child: Divider(
                      //         color: borderMainColor,
                      //         thickness: 1,
                      //       ),
                      //     ),
                      //     SizedBox(width: 8.w),
                      //     const TextWidget(
                      //       title: " أو عبر",
                      //     ),
                      //     SizedBox(width: 8.w),
                      //     const Expanded(
                      //       child: Divider(
                      //         color: borderMainColor,
                      //         thickness: 1,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 26.w),
                      // ButtonWidget(
                      //   backgroundButtonColor: Colors.white,
                      //   withBorder: true,
                      //   child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Expanded(
                      //           child: Image.asset(
                      //             "assets/icons/google_icon.png",
                      //             width: 24.w,
                      //             height: 24.w,
                      //             alignment: AlignmentDirectional.center,
                      //             fit: BoxFit.contain,
                      //           ),
                      //         ),
                      //         const Expanded(
                      //           flex: 2,
                      //           child: TextWidget(
                      //             title: "دخول عبر جوجل",
                      //             textAlign: TextAlign.start,
                      //           ),
                      //         ),
                      //       ]),
                      // ),
                      // SizedBox(height: 32.h),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () => Utils.openScreen(context, SignUp()),
                          child: RichText(
                              text: TextSpan(
                                  text: LocaleKeys.dont_have_acc.tr()+" ",
                                  style: TextStyle(
                                      fontFamily: 'Bahij',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: secondaryColor),
                                  children: [
                                TextSpan(
                                  text: LocaleKeys.register.tr(),
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
            ),
          );
        },
      ),
    ));
  }
}

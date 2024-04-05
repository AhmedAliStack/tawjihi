// because Directionality of otp ltr agnoire with tr() method i use as tr
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/alerts.dart';
import 'package:tawjihi_quiz/presentation/components/button_widget.dart';
import 'package:tawjihi_quiz/presentation/screens/exams_by_teacher/exams_by_teacher.dart';
import 'package:tawjihi_quiz/presentation/screens/subscrib_code/cubit/code_cubit.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';

class SubscribCode extends StatelessWidget {
  final String teacherName;
  final String rate;
  final int id;
  const SubscribCode(
      {super.key,
      required this.teacherName,
      required this.rate,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w, top: 32.h),
          child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Utils.backWidget(context, authScreensBack: true)),
        ),
        Expanded(
          child: BlocProvider(
            create: (context) => CodeCubit()..requestCode(),
            child: BlocConsumer<CodeCubit, CodeState>(
              listener: (context, state) {
                if (state is ErrorCodeState) {
                  OverLays.toast(text: state.error ?? LocaleKeys.wrong_msg);
                }
                if (state is SuccessCodeState) {
                  OverLays.toast(text: LocaleKeys.success_sub);

                  Utils.openScreen(
                      context,
                      ExamsByTeacher(
                          teacherName: teacherName, rate: rate, id: id),
                      replacment: true);
                }
              },
              builder: (context, state) {
                final cubit = CodeCubit.get(context);
                return state is LoadingRequestCode
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 32.h),
                                    Image.asset(
                                      "assets/images/otp.png",
                                      width: 175.w,
                                      height: 160.w,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(height: 32.h),
                                    TextWidget(
                                      title: LocaleKeys.sub_code,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(height: 8.h),
                                    const TextWidget(
                                      title:
                                          LocaleKeys.enter_sub_code,
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 32.h, right: 64.w, left: 64.w),
                                      child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: PinCodeTextField(
                                          backgroundColor: Colors.white,
                                          appContext: context,
                                          length: 4,
                                          animationType: AnimationType.fade,
                                          validator: (v) {
                                            return null;
                                          },
                                          pinTheme: PinTheme(
                                            shape: PinCodeFieldShape.circle,
                                            fieldHeight: 60.w,
                                            fieldWidth: 50.w,
                                            borderRadius:
                                                BorderRadius.circular(8.0.r),
                                            activeFillColor: borderMainColor,
                                            activeColor: mauveColor,
                                            selectedColor: yellow,
                                            inactiveFillColor: borderMainColor,
                                            inactiveColor: borderMainColor,
                                            selectedFillColor: borderMainColor,
                                          ),
                                          cursorColor: secondaryColor,
                                          errorTextSpace: 25,
                                          animationDuration:
                                              const Duration(milliseconds: 300),
                                          enableActiveFill: true,
                                          keyboardType: TextInputType.text,
                                          textStyle: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                          onCompleted: (v) {
                                            cubit.sendCode(v);
                                          },
                                          onChanged: (_) {},
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    state is LoadingRequestCodeButton
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : GestureDetector(
                                            onTap: () => cubit.requestCode(
                                                firstRequest: false),
                                            child: RichText(
                                              text: TextSpan(
                                                text:
                                                    LocaleKeys.code_not_send,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'Bahij',
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: LocaleKeys.resend_again,
                                                      style: TextStyle(
                                                          color: secondaryColor,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                            ),
                                          )
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0.w),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: state is LoadingCodeState
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : ButtonWidget(
                                            onTap: () => OverLays.toast(
                                                text:
                                                    LocaleKeys.enter_correct_code),

                                            // Utils.successDialog(
                                            //   context: context,
                                            //   title: "تم التفعيل بنجاح",
                                            // ).then((value) => Navigator.pop(context)),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.white,
                                                    size: 25.w,
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  const TextWidget(
                                                    title: LocaleKeys.activate_code,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  )
                                                ]),
                                          ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: ButtonWidget(
                                      onTap: () => Navigator.pop(context),
                                      backgroundButtonColor: borderMainColor,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.close,
                                              color: const Color(0xffFF3838),
                                              size: 25.w,
                                            ),
                                            SizedBox(width: 4.w),
                                            const TextWidget(
                                              title: LocaleKeys.cancel,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff6D6D6D),
                                            )
                                          ]),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      );
              },
            ),
          ),
        )
      ],
    ));
  }
}

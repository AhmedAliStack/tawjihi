import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/core/utils/validation.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/alerts.dart';
import 'package:tawjihi_quiz/presentation/components/button_widget.dart';
import 'package:tawjihi_quiz/presentation/components/edit_text_widget.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';
import 'package:tawjihi_quiz/presentation/screens/sign_up/widgets/custom_edit_text.dart';
import 'package:tawjihi_quiz/presentation/screens/support/cubit/support_cubit.dart';
import 'package:tawjihi_quiz/services_locator.dart';

class Support extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => SupportCubit(),
        child: BlocConsumer<SupportCubit, SupportState>(
          listener: (context, state) {
            if (state is SuccessSupportState) {
              OverLays.toast(text: "تم الارسال بنجاح");
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            SupportCubit cubit = SupportCubit.get(context);
            return Column(children: [
              Container(
                height: 0.4.sw,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffF8F8F8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 16.w, top: 32.h, end: 16.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Utils.backWidget(context, authScreensBack: true),
                      SizedBox(width: 32.w),
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: gradientButton),
                        ),
                        child: Image.asset(
                          'assets/icons/message_active.png',
                          width: 24.w,
                          height: 24.w,
                          fit: BoxFit.fill,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(
                            title: "الدعم الفنى",
                            color: Colors.black,
                          ),
                          SizedBox(height: 8.h),
                          // TextWidget(
                          //   title: "محمد الزيات",
                          //   fontSize: 12.sp,
                          //   color: secondaryColor.withOpacity(0.5),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(height: 16.h),
                      CustomEditText(
                        img: "assets/icons/support_field.png",
                        label: "عنوان الرسالة",
                        controller: cubit.titleControler,
                        validator: locator<Validation>().defaultValidation,
                      ),
                      SizedBox(height: 16.w),
                      EditTextWidget(
                        label: "وصف المشكلة",
                        controller: cubit.megControler,
                        type: TextInputType.text,
                        validator: locator<Validation>().defaultValidation,
                        minLines: 8,
                        maxLines: 8,
                      ),
                    ]),
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: ButtonWidget(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      cubit.sendSupportMsg();
                    }
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/message2.png",
                          width: 24.w,
                          height: 24.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 8.w),
                        TextWidget(
                          title: "ارسال رسالة",
                          fontSize: 16.sp,
                          color: Colors.white,
                        )
                      ]),
                ),
              ),
              SizedBox(height: 16.h),
            ]);
          },
        ),
      ),
    );
  }
}

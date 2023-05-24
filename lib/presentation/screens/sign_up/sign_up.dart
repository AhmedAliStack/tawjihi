import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/utils/validation.dart';
import 'package:tawjihi_quiz/presentation/components/alerts.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/sign_up/widgets/custom_drop_down.dart';
import 'package:tawjihi_quiz/presentation/screens/sign_up/widgets/custom_edit_text.dart';
import 'package:tawjihi_quiz/services_locator.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/button_widget.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../home_layout/home.dart';
import '../login/login.dart';
import 'cubit/sign_up_cubit.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit()..getAll(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SuccessSignUpState) {
            Utils.openScreen(context, const Home(), remove: true);
          }
          if (state is ErrorSignUpState) {
            OverLays.toast(text: state.error);
          }
        },
        builder: (context, state) {
          final cubit = SignUpCubit.get(context);
          return BaseStateless(
            body: LoadingAndError(
              isLoading: state is LoadingSignUpState,
              isError: state is ErrorSignUpState,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 32.h, left: 16.w, right: 16.w, bottom: 16.h),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Utils.backWidget(context, authScreensBack: true),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          TextWidget(
                            title: "تسجيل حساب جديد",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 8.h),
                          TextWidget(
                            title: "قم بملىء البيانات الخاصة بك للتسجيل",
                            fontSize: 14.sp,
                          ),
                          SizedBox(height: 32.h),
                          CustomEditText(
                            img: "assets/icons/profile-circle.png",
                            label: "الاسم",
                            controller: cubit.firstNameControler,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/profile-circle.png",
                            label: "اسم العائلة",
                            controller: cubit.lastNameControler,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            icon: Icons.email_outlined,
                            label: "البريد الالكتروني",
                            controller: cubit.emailControler,
                            type: TextInputType.emailAddress,
                            validator: locator<Validation>().emailValidation,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            icon: Icons.phone_outlined,
                            label: "الهاتف الجوال",
                            controller: cubit.phoneControler,
                            type: TextInputType.phone,
                            validator: locator<Validation>().defaultValidation,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/building.png",
                            label: "الجنسية",
                            controller: cubit.nationalityControler,
                          ),
                          SizedBox(height: 16.w),
                          CustomDropDown(
                            title: "اختر البد",
                            icon: Icons.flag_outlined,
                            onItemSelected: (value) {
                              cubit.changeSelectedItemDropDown(
                                  value: value, numer: 1);
                            },
                            dropdownItems:
                                Utils.countries.map((e) => e.name!).toList(),
                            dropdownValue: cubit.country,
                            validator: (value) {
                              if (value == null) {
                                return 'الرجاء اختيار البد';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.w),
                          CustomDropDown(
                            title: "المنهج",
                            icon: Icons.school,
                            onItemSelected: (value) {
                              cubit.changeSelectedItemDropDown(
                                  value: value, numer: 2);
                            },
                            dropdownItems:
                                Utils.manhags.map((e) => e.title!).toList(),
                            dropdownValue: cubit.manhag,
                            validator: (value) {
                              if (value == null) {
                                return 'الرجاء اختيار المنهج';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.w),
                          CustomDropDown(
                            title: "الصف",
                            icon: Icons.school,
                            onItemSelected: (value) {
                              cubit.changeSelectedItemDropDown(
                                  value: value, numer: 3);
                            },
                            dropdownItems:
                                Utils.terms.map((e) => e.title!).toList(),
                            dropdownValue: cubit.term,
                            validator: (value) {
                              if (value == null) {
                                return 'الرجاء اختيار الصف';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.w),
                          CustomDropDown(
                            title: "القسم",
                            icon: Icons.school,
                            onItemSelected: (value) {
                              cubit.changeSelectedItemDropDown(
                                  value: value, numer: 4);
                            },
                            dropdownItems:
                                Utils.subjectType.map((e) => e.title!).toList(),
                            dropdownValue: cubit.subjectType,
                            validator: (value) {
                              if (value == null) {
                                return 'الرجاء اختيار القسم';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/lock.png",
                            label: "رقم المرور",
                            controller: cubit.passwordController,
                            type: TextInputType.visiblePassword,
                            validator: locator<Validation>().validatePassword,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/lock.png",
                            label: "تأكيد رقم المرور",
                            controller: cubit.passwordConfirmation,
                            type: TextInputType.visiblePassword,
                            validator: (p) {
                              return locator<Validation>()
                                  .confirmPasswordValidation(
                                      p, cubit.passwordController.text);
                            },
                          ),
                          SizedBox(height: 16.w),
                          Row(children: [
                            Transform.scale(
                              scale: 1.3.w,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  unselectedWidgetColor:
                                      const Color(0xffCBD5E1),
                                ),
                                child: Checkbox(
                                  value: cubit.checkBox,
                                  onChanged: (value) =>
                                      cubit.changeCheckBox(value!),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.r)),
                                ),
                              ),
                            ),
                            const TextWidget(
                              title: "أوافق على الشروط والأحكام",
                              color: secondaryColor,
                            ),
                          ]),
                          SizedBox(height: 32.h),
                          ButtonWidget(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.arrow_back,
                                    color: Colors.white),
                                SizedBox(width: 8.w),
                                const TextWidget(
                                  title: "تسجيل",
                                  color: Colors.white,
                                )
                              ],
                            ),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                if (!cubit.checkBox) {
                                  OverLays.toast(
                                      text: "يجب الموافقة على الشروط والأحكام");
                                  return;
                                }
                                cubit.sendData();
                              }
                            },
                          ),
                          SizedBox(height: 32.h),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () =>
                                  Utils.openScreen(context, LoginScreen()),
                              child: RichText(
                                  text: TextSpan(
                                      text: " لديك حساب بالفعل ؟ ",
                                      style: TextStyle(
                                          fontFamily: 'Bahij',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: secondaryColor),
                                      children: [
                                    TextSpan(
                                      text: "تسجيل دخول",
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
              ),
            ),
          );
        },
      ),
    );
  }
}

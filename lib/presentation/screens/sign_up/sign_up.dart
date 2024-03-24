import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/utils/validation.dart';
import 'package:tawjihi_quiz/presentation/components/alerts.dart';
import 'package:tawjihi_quiz/presentation/components/dropdown_widget.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/sign_up/widgets/custom_edit_text.dart';
import 'package:tawjihi_quiz/services_locator.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
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
                            title: LocaleKeys.register_acc,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 8.h),
                          TextWidget(
                            title: LocaleKeys.fill_data,
                            fontSize: 14.sp,
                          ),
                          SizedBox(height: 32.h),
                          CustomEditText(
                            img: "assets/icons/profile-circle.png",
                            label: LocaleKeys.name,
                            controller: cubit.firstNameControler,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/profile-circle.png",
                            label: LocaleKeys.family,
                            controller: cubit.lastNameControler,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            icon: Icons.email_outlined,
                            label: LocaleKeys.email,
                            controller: cubit.emailControler,
                            type: TextInputType.emailAddress,
                            validator: locator<Validation>().emailValidation,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            icon: Icons.phone_outlined,
                            label: LocaleKeys.phone,
                            controller: cubit.phoneControler,
                            type: TextInputType.phone,
                            validator: locator<Validation>().defaultValidation,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/building.png",
                            label: LocaleKeys.nationality_opt,
                            controller: cubit.nationalityControler,
                            validator: (p) {
                              return;
                            },
                          ),
                          SizedBox(height: 16.w),
                          DropdownWidget(
                              buttonTexthint: LocaleKeys.choose_country.tr(),
                              buttonWidth: double.infinity,
                              customSelectedItem: Text(
                                cubit.country?.name ?? LocaleKeys.choose_country.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                //overflow: TextOverflow.ellipsis,
                              ),
                              buttonElevation: false,
                              customeItems: Utils.countries
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.name ?? "",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              dropdownButtonTextStyle: TextStyle(
                                fontSize: 14.sp,
                              ),
                              dropdownMenuTextStyle: TextStyle(fontSize: 14.sp),
                              onItemSelected: (value) {
                                cubit.changeSelectedItemDropDown(
                                    value: value, numer: 1);
                              }),
                          SizedBox(height: 16.w),
                          DropdownWidget(
                              buttonTexthint: LocaleKeys.choose_material.tr(),
                              buttonWidth: double.infinity,
                              customSelectedItem: Text(
                                cubit.manhag?.title ?? LocaleKeys.choose_material.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                //overflow: TextOverflow.ellipsis,
                              ),
                              buttonElevation: false,
                              customeItems: Utils.manhags
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.title ?? "",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              dropdownButtonTextStyle: TextStyle(
                                fontSize: 14.sp,
                              ),
                              dropdownMenuTextStyle: TextStyle(fontSize: 14.sp),
                              onItemSelected: (value) {
                                cubit.changeSelectedItemDropDown(
                                    value: value, numer: 2);
                              }),
                          SizedBox(height: 16.w),
                          DropdownWidget(
                              buttonTexthint: LocaleKeys.choose_class.tr(),
                              buttonWidth: double.infinity,
                              customSelectedItem: Text(
                                cubit.term?.title ?? LocaleKeys.choose_class.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                //overflow: TextOverflow.ellipsis,
                              ),
                              buttonElevation: false,
                              customeItems: Utils.terms
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.title ?? "",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              dropdownButtonTextStyle: TextStyle(
                                fontSize: 14.sp,
                              ),
                              dropdownMenuTextStyle: TextStyle(fontSize: 14.sp),
                              onItemSelected: (value) {
                                cubit.changeSelectedItemDropDown(
                                    value: value, numer: 3);
                              }),
                          SizedBox(height: 16.w),
                          DropdownWidget(
                              buttonTexthint: LocaleKeys.choose_section.tr(),
                              buttonWidth: double.infinity,
                              customSelectedItem: Text(
                                cubit.subjectType?.title ?? LocaleKeys.choose_section.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                //overflow: TextOverflow.ellipsis,
                              ),
                              buttonElevation: false,
                              buttonHeight: 60.h,
                              customeItems: Utils.subjectType
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.title ?? "",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              dropdownButtonTextStyle: TextStyle(
                                fontSize: 14.sp,
                              ),
                              dropdownMenuTextStyle: TextStyle(fontSize: 14.sp),
                              onItemSelected: (value) {
                                cubit.changeSelectedItemDropDown(
                                    value: value, numer: 4);
                              }),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/lock.png",
                            label: LocaleKeys.password,
                            controller: cubit.passwordController,
                            type: TextInputType.visiblePassword,
                            validator: locator<Validation>().validatePassword,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/lock.png",
                            label: LocaleKeys.confirm_pass,
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
                              title: LocaleKeys.condition_agree,
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
                                  title: LocaleKeys.reg,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                if (!cubit.checkBox) {
                                  OverLays.toast(
                                      text: LocaleKeys.agree_msg);
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
                                      text: LocaleKeys.has_acc,
                                      style: TextStyle(
                                          fontFamily: 'Bahij',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: secondaryColor),
                                      children: [
                                    TextSpan(
                                      text: LocaleKeys.login,
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

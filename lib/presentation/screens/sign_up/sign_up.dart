import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/screens/sign_up/widgets/custom_edit_text.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/button_widget.dart';
import '../../components/dropdown_widget.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../home_layout/home.dart';
import '../login/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> dropdownItems = [
    "سعودي الجنسية",
    "مصري الجنسية",
    "سوري الجنسية",
    "لبناني الجنسية",
  ];
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w, bottom: 16.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Utils.backWidget(context, authScreensBack: true),
              ],
            ),
            SizedBox(height: 16.h),
            TextWidget(
              title: "تسجيل حساب جديد".tr(),
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
            ),
            SizedBox(height: 16.w),
            CustomEditText(
              icon: Icons.email_outlined,
              label: "البريد الالكتروني",
            ),
            SizedBox(height: 16.w),
            CustomEditText(icon: Icons.phone_outlined, label: "الهاتف الجوال"),
            SizedBox(height: 16.w),
            CustomEditText(
                img: "assets/icons/building.png", label: "اختر البلد"),
            SizedBox(height: 16.w),
            SizedBox(
              width: double.infinity,
              child: DropdownWidget(
                buttonPadding: EdgeInsetsDirectional.only(end: 16.w),
                customSelectedItem:
                    Row(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.flag_outlined,
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
                  const TextWidget(
                    title: "اختر المنطقة",
                  )
                ]),
                buttonTexthint: "اختر المنطقة",
                items: dropdownItems,
                selectedItem: dropdownValue,
                buttonBorderRaduis: 16.r,
                onItemSelected: (value) {
                  // number is unique to compare between cases in changeSelectedItemDropDown method in cubit
                  setState(() {
                    dropdownValue = value;
                  });
                },
                buttonElevation: false,
              ),
            ),
            SizedBox(height: 16.w),
            CustomEditText(img: "assets/icons/lock.png", label: "رقم المرور"),
            SizedBox(height: 16.w),
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
                title: "أوافق على الشروط والأحكام",
                color: secondaryColor,
              ),
            ]),
            SizedBox(height: 32.h),
            ButtonWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 8.w),
                  TextWidget(
                    title: "تسجيل".tr(),
                    color: Colors.white,
                  )
                ],
              ),
              onTap: () => Utils.openScreen(context, const Home()),
            ),
            SizedBox(height: 32.h),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => Utils.openScreen(context, const LoginScreen()),
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
    );
  }
}

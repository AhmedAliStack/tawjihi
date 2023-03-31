import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';

import '../../../core/utils/utils.dart';
import '../../components/button_widget.dart';
import '../../components/dropdown_widget.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../settings/settings.dart';
import '../sign_up/widgets/custom_edit_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Utils.backWidget(context, authScreensBack: true),
              TextWidget(
                title: "تعديل بياناتى",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              SizedBox(width: 32.w),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(alignment: AlignmentDirectional.topEnd, children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          const AssetImage('assets/images/gradient_circle.png'),
                      child: CircleAvatar(
                        radius: 45.r,
                        backgroundImage:
                            const AssetImage('assets/images/teacher.png'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: gradientButton),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                        size: 16.w,
                      ),
                    )
                  ]),
                  SizedBox(height: 16.h),
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
                  CustomEditText(
                      img: "assets/icons/lock.png", label: "رقم المرور"),
                  SizedBox(height: 64.h),
                  ButtonWidget(
                    title: "حفظ",
                    fontSize: 16.sp,
                    onTap: () => Utils.successDialog(
                            context: context,
                            title: "تم الحفظ بنجاح",
                            screen: const Settings())
                        .then((value) =>
                            Utils.openScreen(context, const Settings())),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

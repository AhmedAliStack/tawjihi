// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tawjihi_quiz/domain/models/my_teachers_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/button_widget.dart';
import '../../components/text_widget.dart';
import '../chat/chat.dart';

class Teacherinfo extends StatelessWidget {
  final Data? teacherData;
  const Teacherinfo({
    Key? key,
    required this.teacherData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: gradientButton),
          ),
        ),
        Column(children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.w, top: 64.h, end: 16.w, bottom: 64.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Utils.backWidget(context),
                TextWidget(
                  title: "معلومات المدرس",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                SizedBox(width: 32.w),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r),
                ),
              ),
              child: Column(children: [
                SizedBox(height: 64.h),
                TextWidget(
                  title: teacherData?.name,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff444444),
                ),
                SizedBox(height: 16.h),
                TextWidget(
                  title: teacherData?.subject,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff444444).withOpacity(0.5),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: IntrinsicHeight(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              int phoneNumber = teacherData?.phone ?? 0;
                              final url = 'tel:$phoneNumber';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                throw 'Unable to open phone number';
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: const BoxDecoration(
                                  color: Color(0xff53D575),
                                  shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/icons/call.png",
                                width: 30.w,
                                height: 30.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 2.w,
                            color: borderMainColor,
                            endIndent: 8.h,
                            indent: 8.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              int phoneNumber = teacherData?.phone ?? 0;
                              final url = 'sms:$phoneNumber';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                throw 'Unable to open sms';
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: const BoxDecoration(
                                  color: Color(0xff6B5AED),
                                  shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/icons/sms.png",
                                width: 30.w,
                                height: 30.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 2.w,
                            color: borderMainColor,
                            endIndent: 8.h,
                            indent: 8.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: const BoxDecoration(
                                color: Color(0xff048FFB),
                                shape: BoxShape.circle),
                            child: Image.asset(
                              "assets/icons/website.png",
                              width: 30.w,
                              height: 30.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(height: 32.h),
                Divider(
                  thickness: 2.w,
                  color: borderMainColor,
                  indent: 0.3.sw,
                  endIndent: 0.3.sw,
                ),
                SizedBox(height: 32.h),
                TextWidget(
                  title: "عدد الطلاب : ${teacherData?.studentCount}",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                SizedBox(height: 16.h),
                TextWidget(
                  title: "نسبة التفاعل مع الطلاب : ${teacherData?.average}%",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                  child: ButtonWidget(
                    onTap: () => Utils.openScreen(
                        context,
                        Chat(
                          teacherId: teacherData?.id ?? 0,
                          chatId: teacherData?.id ?? 0,
                          image: teacherData?.image ?? "",
                          name: teacherData?.name ?? "",
                        )),
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
              ]),
            ),
          )
        ]),
        Padding(
          padding: EdgeInsets.only(top: 0.18.sh),
          child: Align(
            alignment: Alignment.topCenter,
            child: Stack(children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 46.r,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      teacherData?.image ?? '',
                      width: 100.w,
                      height: 100.w,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/app_logo.png',
                        width: 100.w,
                        height: 100.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}

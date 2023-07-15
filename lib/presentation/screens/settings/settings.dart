import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/screens/about_us/about_us.dart';
import 'package:tawjihi_quiz/presentation/screens/settings/widgets/item_of_settings.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/screens/support/support.dart';
import '../../../core/utils/utils.dart';
import '../../components/alerts.dart';
import '../../components/text_widget.dart';
import '../login/login.dart';
import '../profile/profile.dart';
import 'cubit/settings_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SettingsCubit(),
        child: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {
            if (state is SuccessLogoutState) {
              Utils.openScreen(context, LoginScreen(), remove: true);
            }
            if (state is ErrorLogoutState) {
              OverLays.toast(text: state.error);
            }
          },
          builder: (context, state) {
            final cubit = SettingsCubit.get(context);
            return SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: 16.w),
                        Image.asset(
                          "assets/images/logo.png",
                          alignment: AlignmentDirectional.bottomStart,
                          width: 100.w,
                          height: 80.w,
                          fit: BoxFit.fill,
                        ),
                        const Spacer(),
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Image.asset(
                            "assets/images/top_left_q.png",
                            width: 100.w,
                            height: 150.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
                  child: Column(
                    children: [
                      const Divider(color: borderMainColor, thickness: 2),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/teacher.png",
                              width: 50.w,
                              height: 50.w,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      title: "محمد ابراهيم",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    TextWidget(
                                      title: "الصف الاول الاعدادى",
                                      fontSize: 12.sp,
                                      color: const Color(0xff585858),
                                      maxLines: 1,
                                    ),
                                  ]),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.logout();
                              },
                              child: Image.asset(
                                "assets/icons/logout.png",
                                width: 24.w,
                                height: 24.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      const Divider(color: borderMainColor, thickness: 2),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () => Utils.openScreen(context, const Profile()),
                      child: const ItemOfSettings(
                        img: 'assets/icons/profile.png',
                        title: "الملف الشخصي",
                      ),
                    ),
                    // SizedBox(height: 16.w),
                    // GestureDetector(
                    //     onTap: () =>
                    //         Utils.openScreen(context,  SubscribCode()),
                    //     child: const ItemOfSettings(
                    //         img: 'assets/icons/code.png', title: "الكود")),
                    SizedBox(height: 16.w),
                    GestureDetector(
                      onTap: () => Utils.openScreen(context, const AboutUs()),
                      child: const ItemOfSettings(
                        img: 'assets/icons/about.png',
                        title: "عن التطبيق",
                      ),
                    ),
                    SizedBox(height: 16.w),
                    const ItemOfSettings(
                      img: 'assets/icons/share_app.png',
                      title: "مشاركة التطبيق",
                    ),
                    SizedBox(height: 16.w),
                    GestureDetector(
                      onTap: () => Utils.openScreen(context, Support()),
                      child: const ItemOfSettings(
                        img: 'assets/icons/support.png',
                        title: "الدعم الفنى",
                      ),
                    ),
                    SizedBox(height: 16.w),
                    // const ItemOfSettings(
                    //   img: 'assets/icons/lang.png',
                    //   title: "اللغة",
                    // ),
                    // SizedBox(height: 16.w),
                  ]),
                )
              ]),
            );
          },
        ),
      ),
    );
  }
}

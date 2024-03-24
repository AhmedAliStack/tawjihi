import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';

import 'cubit/home_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
              bottomNavigationBar: StyleProvider(
                style: Style(),
                child: ConvexAppBar(
                  style: TabStyle.fixed,
                  backgroundColor: const Color(0xffF8F8F8),
                  color: const Color(0xffDED6DE),
                  activeColor: secondaryColor,
                  initialActiveIndex: 2,
                  height: 68.w,
                  items: [
                    TabItem(
                      icon: Image.asset(
                        'assets/icons/message.png',
                        width: 20.w,
                        height: 20.w,
                        fit: BoxFit.contain,
                      ),
                      title: LocaleKeys.messages.tr(),
                      activeIcon: Column(
                        children: [
                          Image.asset(
                            'assets/icons/message_active.png',
                            width: 30.w,
                            height: 30.w,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                   TabItem(
                        icon: Icons.notifications, title: LocaleKeys.notifications.tr()),
                    TabItem(
                      icon: Image.asset(
                        'assets/icons/home.png',
                        width: 40.w,
                        height: 40.w,
                      ),
                    ),
                   TabItem(icon: Icons.school_rounded, title: LocaleKeys.my_teachers.tr()),
                   TabItem(icon: Icons.settings, title: LocaleKeys.edit.tr()),
                  ],
                  onTap: (int i) => cubit.changeIndex(i),
                ),
              ),
              body: cubit.screens[cubit.currentIndex]);
        },
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 60.w;

  @override
  double get activeIconMargin => 40.w;

  @override
  double get iconSize => 30.w;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      fontFamily: "Bahij",
      color: header.withOpacity(0.5),
    );
  }
}

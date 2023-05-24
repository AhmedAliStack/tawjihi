import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/utils/statics.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/local/local_hive.dart';
import 'package:tawjihi_quiz/presentation/screens/home_layout/home.dart';
import 'package:tawjihi_quiz/services_locator.dart';
import '../login/login.dart';
import 'cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashCubit(),
        child: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Stack(
              children: [
                Image.asset(
                  "assets/images/splash_background.png",
                  width: double.infinity,
                  height: double.infinity,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Image.asset(
                    "assets/images/top_right_q.png",
                    width: 200.w,
                    height: 200.w,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Image.asset(
                    "assets/images/bottom_q.png",
                    width: 150.w,
                    height: 150.w,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 0.4.sh),
                    Expanded(
                      child: OpacityAnimatedWidget.tween(
                        opacityEnabled: 1,
                        opacityDisabled: 0,
                        duration: const Duration(milliseconds: 2000),
                        enabled: true,
                        animationFinished: (finished) async {
                          final token = await locator<DataManager>()
                              .getData(Statics.token);
                          if (token != null) {
                            Utils.openScreen(context, const Home(),
                                remove: true);
                          } else {
                            Utils.openScreen(context, LoginScreen(),
                                remove: true);
                          }
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/logo.png",
                              width: 0.4.sw,
                              height: 0.3.sw,
                              fit: BoxFit.contain,
                            ),
                            const Expanded(child: SizedBox()),
                            Image.asset(
                              "assets/images/logo2.png",
                              width: 0.4.sw,
                              height: 0.1.sw,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: 32.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

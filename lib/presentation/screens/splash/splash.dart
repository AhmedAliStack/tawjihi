import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import '../login/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              "assets/images/top_left_q.png",
              width: 150.w,
              height: 150.w,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 0.4.sh),
              OpacityAnimatedWidget.tween(
                opacityEnabled: 1,
                opacityDisabled: 0,
                duration: const Duration(milliseconds: 2000),
                enabled: true,
                animationFinished: (finished) {
                  Utils.openScreen(context, const LoginScreen());
                },
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 0.4.sw,
                  height: 0.3.sw,
                  fit: BoxFit.contain,
                ),
              ),
              const Expanded(child: SizedBox()),
              OpacityAnimatedWidget.tween(
                opacityEnabled: 1,
                opacityDisabled: 0,
                duration: const Duration(milliseconds: 2000),
                enabled: true,
                animationFinished: (finished) {},
                child: Image.asset(
                  "assets/images/logo2.png",
                  width: 0.2.sw,
                  height: 0.1.sw,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ],
      ),
    );
  }
}

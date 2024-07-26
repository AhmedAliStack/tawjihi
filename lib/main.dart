import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:tawjihi_quiz/bloc_observer.dart';
import 'package:tawjihi_quiz/presentation/screens/about_us/cubit/about_us_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/achievements/cubit/achievements_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/chat/cubit/chat_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/notifications/cubit/notifications_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/settings/cubit/settings_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/splash/splash.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/push_notification_service.dart';
import 'package:tawjihi_quiz/services_locator.dart';
import 'package:tawjihi_quiz/translations/codegen_loader.g.dart';
import 'presentation/screens/converstions/cubit/converstions_cubit.dart';
import 'presentation/screens/exams_by_teacher/cubit/exams_by_teacher_cubit.dart';
import 'presentation/screens/teachers/cubit/my_teacher_cubit.dart';
import 'presentation/screens/the_best/cubit/the_best_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService().setupInteractedMessage();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  ServicesLocator.init();
  Bloc.observer = AppBlocObserver();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child: const MyApp()));

  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    // App received a notification when it was killed
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, screenUtil) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MultiBlocProvider(
              providers: [

                BlocProvider(
                    create: (context) => SettingsCubit()),
                BlocProvider(
                    create: (context) => MyTeacherCubit()..getMyTeachers()),
                BlocProvider(
                    create: (context) =>
                        NotificationsCubit()..getNotifications()),
                BlocProvider(
                    create: (context) =>
                        AchievementsCubit()..getAchievements()),
                BlocProvider(
                    create: (context) => TheBestCubit()..getBestStudents()),
                BlocProvider(create: (context) => AboutUsCubit()..getAboutUs()),
                BlocProvider(create: (context) => ExamsByTeacherCubit()),
                BlocProvider(
                    create: (context) =>
                        ConverstionsCubit()..getConverstions()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                title: 'Tawjihi',
                theme: ThemeData(
                    primaryColor: primaryColor,
                    fontFamily: 'Bahij',
                    appBarTheme:
                        const AppBarTheme(color: primaryColor, elevation: 0)),
                navigatorObservers: [FlutterSmartDialog.observer],
                builder: FlutterSmartDialog.init(),
                home: const SplashScreen(),
              ),
            ),
          );
        });
  }
}

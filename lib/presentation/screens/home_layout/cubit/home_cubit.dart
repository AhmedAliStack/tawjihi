import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main_screen/main_screen.dart';
import '../../messages/messages.dart';
import '../../notifications/notifications.dart';
import '../../settings/settings.dart';
import '../../teachers/teachers.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;
  List<Widget> screens = [
    Messages(),
    Notifications(),
    MainScreen(),
    Teachers(),
    Settings()
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeScreensIndex());
  }
}
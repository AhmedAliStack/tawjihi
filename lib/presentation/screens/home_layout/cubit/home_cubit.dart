import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/utils.dart';
import '../../main_screen/main_screen.dart';
import '../../converstions/converstions.dart';
import '../../notifications/notifications.dart';
import '../../settings/settings.dart';
import '../../teachers/my_teachers.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;
  List<Widget> screens = [
    const Converstions(),
    const Notifications(),
    const MainScreen(),
    const MyTeachers(),
    const Settings()
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeScreensIndex());
  }
  void initData(){
    Utils.getAllListModel();
  }
}

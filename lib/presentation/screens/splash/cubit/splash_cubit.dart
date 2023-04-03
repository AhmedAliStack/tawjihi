import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/domain/repositry/splash_repo.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  getAll() async {
    final respose = await SplashRepo.getAllLists();
    if (respose != null) {
      emit(SuccessSplashState());
    } else {
      emit(ErrorSplashState());
    }
  }
}

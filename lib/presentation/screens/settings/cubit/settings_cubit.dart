import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repositry/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);
  logout() async {
    final respose = await SettingsRepo.logout();
    if (respose != null) {
      emit(SuccessLogoutState());
    } else {
      emit(ErrorLogoutState(respose.data["message"]));
    }
  }
}

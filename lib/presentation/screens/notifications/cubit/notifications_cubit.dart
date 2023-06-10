import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/notifications_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  static NotificationsCubit get(context) => BlocProvider.of(context);
  NotificationsModel? notificationsModel;
  getNotifications() async {
    emit(LoadingNotificationsState());
    final respose = await locator<DioHelper>()
        .getData(url: "user/notifications", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      notificationsModel = NotificationsModel.fromJson(respose?.data);
      emit(SuccessNotificationsState());
    } else {
      emit(ErrorNotificationsState(error: respose?.statusMessage));
    }
  }
}

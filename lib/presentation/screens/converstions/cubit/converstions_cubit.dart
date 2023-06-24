import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/converstions_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'converstions_state.dart';

class ConverstionsCubit extends Cubit<ConverstionsState> {
  ConverstionsCubit() : super(ConverstionsInitial());
  static ConverstionsCubit get(context) => BlocProvider.of(context);
  ConverstionsModel? converstionsModel;
  getConverstions() async {
    emit(LoadingConverstionsState());
    final respose = await locator<DioHelper>()
        .getData(url: "messages", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      converstionsModel = ConverstionsModel.fromJson(respose?.data);
      emit(SuccessConverstionsState());
    } else {
      emit(ErrorConverstionsState(error: respose?.statusMessage));
    }
  }
}

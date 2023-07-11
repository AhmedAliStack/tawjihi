import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/chat_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  ChatModel? chatModel;
  List<Data> chatList = [];
  getChat({required int chatId}) async {
    emit(LoadingChatState());
    final respose = await locator<DioHelper>()
        .getData(url: "messages/$chatId", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      chatModel = ChatModel.fromJson(respose?.data);
      chatList = chatModel?.data ?? [];
      emit(SuccessChatState());
    } else {
      emit(ErrorChatState(error: respose?.statusMessage));
    }
  }

  sendMsg({required int senderId, required String msg}) async {
    emit(LoadingButton());
    final respose = await locator<DioHelper>().postData(
        url: "messages/teacher",
        loading: false,
        token: Utils.token,
        body: {"teacher_id": senderId, "message": msg});
    if (respose?.statusCode == 200) {
      emit(SuccessChatState());
    } else {
      emit(ErrorChatState(error: respose?.statusMessage));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_tests_state.dart';

class MyTestsCubit extends Cubit<MyTestsState> {
  MyTestsCubit() : super(MyTestsInitial());
  static MyTestsCubit get(context) => BlocProvider.of(context);
}

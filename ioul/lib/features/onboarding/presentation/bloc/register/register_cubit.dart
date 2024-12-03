import 'dart:developer';
import '../../../../../core/core.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  // var register = Register();

  pushRegisterationToServer(Register register) async {
    try {
      emit(RegisterLoading());
      final response = await repository.registerStudent(register);
      debugPrint("response body first: ${response.data}");
      if (response.isConnectionSuccessful()) {
        emit(RegisterLoaded(response));
      } else {
        debugPrint("response error body: ${response.responseMessage}");
        emit(RegisterFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(RegisterFailure(message: e.toString()));
    }
  }
}

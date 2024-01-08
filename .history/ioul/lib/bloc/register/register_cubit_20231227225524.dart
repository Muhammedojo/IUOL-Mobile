// import 'package:ioul/response/response.dart';
import 'dart:developer';

import 'package:ioul/utils/global_states.dart';
import '../../model/model.dart';
import '../../packages/package.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  // var register = Register();

  pushRegisterationToServer(Register register) async {
    try {
      final response = await repository.registerStudent(register);
      log("response body first: ${response.toJson()}");
      if (response.isConnectionSuccessful()) {
        emit(RegisterLoaded(response));
      } else {
        log("response error body: ${response.responseMessage}");
        emit(RegisterFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(RegisterFailure(message: e.toString()));
    }
  }
}

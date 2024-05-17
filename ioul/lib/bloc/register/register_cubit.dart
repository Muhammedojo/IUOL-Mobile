import 'dart:developer';
import 'package:ioul/provider/failure.dart';
import 'package:ioul/utils/global_states.dart';
import 'package:ioul/utils/utils.dart';
import '../../model/model.dart';
import '../../packages/package.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  // var register = Register();

  pushRegisterationToServer(Register register) async {
    try {
      emit(RegisterLoading());
      // final response = await repository.registerStudent(register);
      // log("response body first: ${response.data}");
      // if (response.isConnectionSuccessful()) {
      //   emit(RegisterLoaded(response));
      // } else {
      //   log("response error body: ${response.responseMessage}");
      //   emit(RegisterFailure(message: response.responseMessage));
      // }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(RegisterFailure(message: e.toString()));
    }
  }

  pushLoginToServer(LoginData data) async {
    try {
      emit(LoginLoading());
      final response = await repository.login(data);
      log("login response: $response");
      response.fold((l) => emit(LoginFailure(message: l.failureMessage())),
          (r) {
        emit(LoginLoaded(registerStudent: r.data!));
        GlobalVariables.userEmail = r.data!.user?.email ?? "";
      });
    } on Failure catch (e) {
      emit(LoginFailure(message: e.failureMessage()));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}

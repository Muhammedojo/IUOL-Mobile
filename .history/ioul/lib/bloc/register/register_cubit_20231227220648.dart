import 'package:ioul/response/response.dart';
import 'package:ioul/utils/global_states.dart';
import '../../model/model.dart';
import '../../packages/package.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterLoading());
  var register = Register();

  pushRegisterationToServer(Register register) async {
    try {
      final response = await repository.registerStudent(register);
      if (response.isRequestSuccessful()) {
        emit(RegisterLoaded(response));
      } else {
        emit(RegisterFailure(message: response.responseMessage));
      }
    } catch (e) {
      print("problem sending request: ${e.toString()}");
      emit(RegisterFailure(message: e.toString()));
    }
  }
}

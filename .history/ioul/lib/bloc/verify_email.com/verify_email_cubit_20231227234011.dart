import 'package:bloc/bloc.dart';
import 'package:ioul/response/response.dart';
import 'package:meta/meta.dart';

import '../../packages/package.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailInitial());

  pushRegisterationToServer(Register register) async {
    try {
      emit(RegisterLoading());
      final response = await repository.registerStudent(register);
      log("response body first: ${response.data}");
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

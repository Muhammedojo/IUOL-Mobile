import 'dart:developer';
import '../../model/model.dart';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'submit_application_state.dart';

class SubmitApplicationCubit extends Cubit<SubmitApplicationState> {
  SubmitApplicationCubit() : super(SubmitApplicationInitialState());

  pushApplicationToServer(SubmitApplication application) async {
    try {
      emit(SubmitApplicationLoading());
      final response = await repository.submitApplication(application);
      log("response body first: ${response.data}");
      if (response.isConnectionSuccessful()) {
        emit(SubmitApplicationLoaded(response));
      } else {
        log("response error body: ${response.responseMessage}");
        emit(SubmitApplicationFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(SubmitApplicationFailure(message: e.toString()));
    }
  }

  pushProgramToServer(ApplicationFormData formData) async {
    try {
      emit(SubmitApplicationLoading());
      final response = await repository.submitProgram(formData);
      if (response.isConnectionSuccessful()) {
        emit(SubmitApplicationLoaded(response));
      } else {
        log("response error body: ${response.responseMessage}");
        emit(SubmitApplicationFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

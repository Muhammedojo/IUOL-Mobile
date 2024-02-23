import 'dart:developer';
import '../../model/model.dart';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'application_form_data_state.dart';

class ApplicationFormDataCubit extends Cubit<ApplicationFormDataState> {
  ApplicationFormDataCubit() : super(ApplicationFormDataInitialState());

  pushProgramToServer(ApplicationFormData formData) async {
    try {
      emit(ApplicationFormDataLoading());
      final response = await repository.submitProgram(formData);
      if (response.isConnectionSuccessful()) {
        emit(ApplicationFormDataLoaded(formData));
      } else {
        log("response error body: ${response.responseMessage}");
        emit(ApplicationFormDataFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

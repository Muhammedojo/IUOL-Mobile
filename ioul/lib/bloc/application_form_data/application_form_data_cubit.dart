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
      log("application form data response: ${response.genders}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ApplicationFormDataLoaded(response));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(ApplicationFormDataFailure(message: response.message ?? ""));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

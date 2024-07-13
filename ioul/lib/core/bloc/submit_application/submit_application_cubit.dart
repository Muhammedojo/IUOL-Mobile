import '../../core.dart';
import '../../utils/global_states.dart';

class SubmitApplicationCubit extends Cubit<SubmitApplicationState> {
  SubmitApplicationCubit() : super(SubmitApplicationInitialState());

  pushApplicationToServer(SubmitApplication application) async {
    try {
      emit(SubmitApplicationLoading());
      final response = await repository.submitApplication(application);
      // log("response body first: ${response.datas}");
      if (response.isConnectionSuccessful()) {
        emit(SubmitApplicationLoaded(response));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(SubmitApplicationFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(SubmitApplicationFailure(message: e.toString()));
    }
  }
}

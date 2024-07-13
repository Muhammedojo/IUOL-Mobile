import '../../core.dart';
import '../../utils/global_states.dart';

class ApplicationPaymentCubit extends Cubit<ApplicationPaymentState> {
  ApplicationPaymentCubit() : super(ApplicationPaymentInitialState());

  loadApplicationPaymentLinkFromServer() async {
    try {
      emit(ApplicationPaymentLoading());
      final response = await repository.loadApplicationPaymentLink();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ApplicationPaymentLoaded(response));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(ApplicationPaymentFailure(message: response.message.toString()));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

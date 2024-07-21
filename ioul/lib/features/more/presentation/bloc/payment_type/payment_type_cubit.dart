import '../../../../../core/core.dart';
import '../bloc.dart';

class PaymentTypeCubit extends Cubit<PaymentTypeState> {
  PaymentTypeCubit() : super(InitialPaymentTypeState());

  loadPaymentTypeFromServer() async {
    try {
      emit(PaymentTypeLoading());
      final response = await repository.loadPaymentType();
      if (response.statusCode == 201 || response.statusCode == 200) {
        // log("Payment List response: $response");
        emit(PaymentTypeLoaded(response));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(PaymentTypeFailure(message: response.message ?? ""));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

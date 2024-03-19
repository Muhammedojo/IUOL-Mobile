import 'dart:developer';

import '../../model/model.dart';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'cubit.dart';

class PaymentTypeCubit extends Cubit<PaymentTypeState> {
  PaymentTypeCubit() : super(InitialState());

  loadCountiresFromServer() async {
    try {
      emit(PaymentTypeLoading());
      final response = await repository.loadCountries();
      if (response.statusCode == 201 || response.statusCode == 200) {
        log("country response: $response");
        // emit(PaymentTypeLoaded(response.data as List<PaymentType>));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(PaymentTypeFailure(message: response.message ?? ""));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

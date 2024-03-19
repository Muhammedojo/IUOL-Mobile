import 'dart:developer';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitialState());

  loadCountiresFromServer() async {
    // try {
    emit(CountryLoading());
    final response = await repository.loadCountries();
    if (response.statusCode == 201 || response.statusCode == 200) {
      log("country response: $response");
      emit(CountryLoaded(response));
    } else {
      // log("response error body: ${response.responseMessage}");
      emit(CountryFailure(message: response.message ?? ""));
    }
    // }
    // catch (e) {
    //   debugPrint("problem sending request: ${e.toString()}");
    // }
  }
}
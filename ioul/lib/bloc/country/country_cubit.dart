import 'dart:developer';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitialState());

  loadCountiresFromServer() async {
    try {
      emit(CountryLoading());
      final response = await repository.loadCountries();
      if (response.isConnectionSuccessful()) {
        emit(const CountryLoaded());
      } else {
        log("response error body: ${response.responseMessage}");
        emit(CountryFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

import 'dart:developer';

import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'cubit.dart';

class SemesterFormDataCubit extends Cubit<SemesterFormDataState> {
  SemesterFormDataCubit() : super(SemesterFormDataLoading());
  loadSemesterFormDataFromServer() async {
    try {
      emit(SemesterFormDataLoading());
      final response = await repository.loadSemesterFormData();
      if (response.statusCode == 201 || response.statusCode == 200) {
        log("country response: $response");
      } else {
        emit(SemesterFormDataFailure(message: response.message ?? ""));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

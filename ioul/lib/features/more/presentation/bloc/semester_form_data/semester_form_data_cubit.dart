import 'dart:developer';
import '../../../../../core/core.dart';
import '../bloc.dart';

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

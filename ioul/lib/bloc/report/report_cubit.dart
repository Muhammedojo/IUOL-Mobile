import 'dart:developer';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitialState());

  loadReportsFromServer() async {
    try {
      emit(ReportLoading());
      final response = await repository.loadCourses();
      if (response.isConnectionSuccessful()) {
        emit(const ReportLoaded([]));
      } else {
        log("response error body: ${response.responseMessage}");
        emit(ReportFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

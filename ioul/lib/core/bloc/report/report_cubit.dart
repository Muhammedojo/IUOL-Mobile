import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitialState());

  loadReportsFromServer() async {
    try {
      emit(ReportLoading());
      final response = await repository.loadCourses();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(const ReportLoaded([]));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(ReportFailure(message: response.message.toString()));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

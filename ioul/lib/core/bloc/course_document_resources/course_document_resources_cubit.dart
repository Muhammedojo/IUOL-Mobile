import 'dart:developer';
import '../../core.dart';
import '../../utils/global_states.dart';

class CourseDocumentResourcesCubit extends Cubit<CourseDocumentResourcesState> {
  CourseDocumentResourcesCubit() : super(CourseDocumentResourcesInitialState());

  loadCourseDocumentFromServer() async {
    try {
      emit(CourseDocumentResourcesLoading());
      final response = await repository.loadCourseDocument();
      if (response.isConnectionSuccessful()) {
        emit(const CourseDocumentResourcesLoaded());
      } else {
        log("response error body: ${response.responseMessage}");
        emit(CourseDocumentResourcesFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

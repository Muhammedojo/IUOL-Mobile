import 'dart:developer';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'course_document_resources_state.dart';

class CourseDocumentResourcesCubit extends Cubit<CourseDocumentResourcesState> {
  CourseDocumentResourcesCubit() : super(InitialState());

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

import 'dart:developer';
import '../../../../../core/core.dart';
import 'course_detail_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit() : super(CourseDetailsInitialState());

  loadCourseDetailsFromServer() async {
    try {
      emit(CourseDetailsLoading());
      final response = await repository.loadCourseDetails();
      if (response.isConnectionSuccessful()) {
        emit(const CourseDetailsLoaded());
      } else {
        log("response error body: ${response.responseMessage}");
        emit(CourseDetailsFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

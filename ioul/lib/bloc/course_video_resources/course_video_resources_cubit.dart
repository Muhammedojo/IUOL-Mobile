import 'dart:developer';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'course_video_resources_state.dart';

class CourseVideoResourcesCubit extends Cubit<CourseVideoResourcesState> {
  CourseVideoResourcesCubit() : super(InitialState());

  loadCourseVideoFromServer() async {
    try {
      emit(CourseVideoResourcesLoading());
      final response = await repository.loadCourseVideo();
      if (response.isConnectionSuccessful()) {
        emit(const CourseVideoResourcesLoaded());
      } else {
        log("response error body: ${response.responseMessage}");
        emit(CourseVideoResourcesFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

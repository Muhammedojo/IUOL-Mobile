import 'dart:developer';
import '../../core.dart';
import '../../utils/global_states.dart';

class CourseVideoResourcesCubit extends Cubit<CourseVideoResourcesState> {
  CourseVideoResourcesCubit() : super(CourseVideoResourcesInitialState());

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

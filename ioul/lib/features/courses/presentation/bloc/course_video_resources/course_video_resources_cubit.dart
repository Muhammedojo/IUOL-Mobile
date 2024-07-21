import 'dart:developer';
import '../../../../../core/core.dart';
import '../bloc.dart';

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

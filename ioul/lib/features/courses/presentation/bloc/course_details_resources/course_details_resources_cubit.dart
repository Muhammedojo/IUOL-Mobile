import 'dart:developer';
import '../../../../../core/core.dart';
import '../bloc.dart';

class CourseDetailsResourcesCubit extends Cubit<CourseDetailsResourcesState> {
  CourseDetailsResourcesCubit() : super(CourseDetailsResourcesInitialState());

  loadCourseDetailsFromServer() async {
    try {
      emit(CourseDetailsResourcesLoading());
      final response = await repository.loadCourseDetails();
      if (response.isConnectionSuccessful()) {
        emit(const CourseDetailsResourcesLoaded());
      } else {
        log("response error body: ${response.responseMessage}");
        emit(CourseDetailsResourcesFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

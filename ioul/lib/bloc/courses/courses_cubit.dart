import 'dart:developer';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitialState());

  loadCoursesFromServer() async {
    try {
      emit(CoursesLoading());
      final response = await repository.loadCourses();
      if (response.isConnectionSuccessful()) {
        emit(const CoursesLoaded());
      } else {
        log("response error body: ${response.responseMessage}");
        emit(CoursesFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

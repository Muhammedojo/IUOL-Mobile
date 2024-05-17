import 'dart:developer';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'course_reg_state.dart';

class CourseRegCubit extends Cubit<CourseRegState> {
  CourseRegCubit() : super(CourseRegInitialState());

  loadCoursesFromServer() async {
    try {
      emit(CourseRegLoading());
      // final response = await repository.loadCourses();
      // if (response.isConnectionSuccessful()) {
      //   emit(const CourseRegLoaded());
      // } else {
      //   log("response error body: ${response.responseMessage}");
      //   emit(CourseRegFailure(message: response.responseMessage));
      // }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

import '../../core.dart';
import '../../utils/global_states.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitialState());

  loadCoursesFromServer() async {
    try {
      emit(CoursesLoading());
      final response = await repository.loadCourses();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(CoursesLoaded(response.enrolledCourse!));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(CoursesFailure(message: response.message.toString()));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

import 'dart:developer';
import '../../../../../core/core.dart';
import '../bloc.dart';

class CourseRegCubit extends Cubit<CourseRegState> {
  CourseRegCubit() : super(CourseRegInitialState());

  initCourseRegistration() async {
    try {
      emit(CourseRegLoading());
      final response = await repository.initializeCourseReg();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(CourseRegLoaded(response));
      } else {
        log("response error body: ${response.message}");
        emit(CourseRegFailure(message: '${response.message}'));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }

  pushCourseRegToServer(SubmitCourseReg reg) async {
    try {
      emit(CourseRegLoading());
      final response = await repository.submitCourseRegistration(reg);

      if (response.isConnectionSuccessful()) {
        emit(CourseRegPushLoaded(response));
      } else {
        log("response error body: ${response.responseMessage}");
        emit(CourseRegFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

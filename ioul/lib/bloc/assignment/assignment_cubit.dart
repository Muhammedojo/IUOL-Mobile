import 'dart:developer';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'assignment_state.dart';

class AssignmentCubit extends Cubit<AssignmentState> {
  AssignmentCubit() : super(AssignmentInitialState());

  loadCourseAssignmentFromServer() async {
    try {
      emit(AssignmentLoading());
      final response = await repository.loadCourses();
      if (response.isConnectionSuccessful()) {
        emit(const AssignmentLoaded());
      } else {
        log("response error body: ${response.responseMessage}");
        emit(AssignmentFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

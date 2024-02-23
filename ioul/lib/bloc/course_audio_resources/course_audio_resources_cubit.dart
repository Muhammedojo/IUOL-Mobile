import 'dart:developer';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'course_audio_resources_state.dart';

class CourseAudioResourcesCubit extends Cubit<CourseAudioResourcesState> {
  CourseAudioResourcesCubit() : super(InitialState());

  loadCourseAudioFromServer() async {
    try {
      emit(CourseAudioResourcesLoading());
      final response = await repository.loadCourseAudio();
      if (response.isConnectionSuccessful()) {
        emit(const CourseAudioResourcesLoaded());
      } else {
        log("response error body: ${response.responseMessage}");
        emit(CourseAudioResourcesFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

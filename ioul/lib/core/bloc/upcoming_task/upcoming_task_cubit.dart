import '../../core.dart';
import '../../utils/global_states.dart';

class UpcomingTaskCubit extends Cubit<UpcomingTaskState> {
  UpcomingTaskCubit() : super(UpcomingTaskInitialState());

  loadTasksFromServer() async {
    try {
      emit(UpcomingTaskLoading());
      final response = await repository.loadUpcomingTasks();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(UpcomingTaskLoaded(response.upcomingAssignment!));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(UpcomingTaskFailure(message: response.message.toString()));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

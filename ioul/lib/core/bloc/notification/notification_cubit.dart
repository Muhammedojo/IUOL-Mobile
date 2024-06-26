import '../../core.dart';
import '../../utils/global_states.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitialState());

  loadNotificationsFromServer() async {
    try {
      emit(NotificationLoading());
      final response = await repository.loadNotifications();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(NotificationLoaded(response.notifications!));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(NotificationFailure(message: response.message.toString()));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

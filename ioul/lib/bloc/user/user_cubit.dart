import '../../utils/global_states.dart';
import '../../packages/package.dart';
import 'cubit.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading());
  int currentPulledCount = 0;

  UserState get initialState => UserLoading();

  loadUser() async {
    try {
      final response = await repository.getUser();
      emit(UserLoaded(response));
    } catch (_) {
      emit(UserNotLoaded());
    }
  }
}

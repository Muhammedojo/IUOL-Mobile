import '../../../../../core/core.dart';
import '../bloc.dart';

class JournalCubit extends Cubit<JournalState> {
  JournalCubit() : super(JournalInitialState());

  loadJournalsFromServer() async {
    try {
      emit(JournalLoading());
      final response = await repository.loadJournal();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(JournalLoaded(response));
        // print('Responses: ${response.datas.toString()}');
      } else {
        //log("response error body: ${response.responseMessage}");
        emit(JournalFailure(message: response.message.toString()));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

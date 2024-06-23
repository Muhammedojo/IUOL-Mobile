import '../../core.dart';
import '../../utils/global_states.dart';

class CollectionCubit extends Cubit<CollectionState> {
  CollectionCubit() : super(CollectionInitialState());

  loadCollectionsFromServer() async {
    try {
      emit(CollectionLoading());
      final response = await repository.loadCollection();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(CollectionLoaded(response));
        // print('Responses: ${response.datas.toString()}');
      } else {
        //log("response error body: ${response.responseMessage}");
        emit(CollectionFailure(message: response.message.toString()));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}

// ignore_for_file: invalid_use_of_visible_for_testing_member

import '../../../../../core/core.dart';
import '../../../../../core/data/response/responses.dart';
import '../bloc.dart';

class CollectionCubit extends Bloc<CollectionEvent, CollectionState> {
  CollectionCubit() : super(CollectionInitialState()) {
    on<SearchCollectionEvent>((event, emit) async {
      try {
        emit(CollectionLoading());
        final response = await repository.searchCollection(event.searchTerm);
        if (response.statusCode == 200 || response.statusCode == 201) {
          // Perform simple string match search
          final filteredData = response.datas
              .where((data) => data
                  .toString()
                  .toLowerCase()
                  .contains(event.searchTerm.toLowerCase()))
              .toList();

          // Emit the filtered data
          emit(CollectionLoaded(GenericResponse(
            datas: filteredData,
            message: response.message,
          )));
        } else {
          //log("response error body: ${response.responseMessage}");
          emit(CollectionFailure(message: response.message.toString()));
        }
      } catch (e) {
        debugPrint("problem sending request: ${e.toString()}");
      }
    });
  }

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

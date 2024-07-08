import '../../data/response/responses.dart';
import '../../core.dart';

abstract class CollectionState extends Equatable {
  const CollectionState();

  @override
  List<Object> get props => [];
}

class CollectionInitialState extends CollectionState {
  @override
  List<Object> get props => [];
}

class CollectionLoading extends CollectionState {
  @override
  List<Object> get props => [];
}

class CollectionLoaded extends CollectionState {
  final GenericResponse response;
  const CollectionLoaded(this.response);

  @override
  List<Object> get props => [response];
}

class CollectionFailure extends CollectionState {
  final String message;
  const CollectionFailure({required this.message});
  @override
  List<Object> get props => [message];
}

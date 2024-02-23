import '../../packages/package.dart';
import '../../response/response.dart';

abstract class StatesState extends Equatable {
  const StatesState();

  @override
  List<Object> get props => [];
}

class StatesInitialState extends StatesState {
  @override
  List<Object> get props => [];
}

class StatesLoading extends StatesState {
  @override
  List<Object> get props => [];
}

class StatesLoaded extends StatesState {
  final GenericResponse statesResponse;
  const StatesLoaded(this.statesResponse);

  @override
  List<Object> get props => [statesResponse];
}

class StatesFailure extends StatesState {
  final String message;
  const StatesFailure({required this.message});
  @override
  List<Object> get props => [message];
}

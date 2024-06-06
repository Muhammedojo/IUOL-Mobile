import 'package:ioul/response/response.dart';
import '../../packages/package.dart';

abstract class JournalState extends Equatable {
  const JournalState();

  @override
  List<Object> get props => [];
}

class JournalInitialState extends JournalState {
  @override
  List<Object> get props => [];
}

class JournalLoading extends JournalState {
  @override
  List<Object> get props => [];
}

class JournalLoaded extends JournalState {
  final GenericResponse response;
  const JournalLoaded(this.response);

  @override
  List<Object> get props => [response];
}

class JournalFailure extends JournalState {
  final String message;
  const JournalFailure({required this.message});
  @override
  List<Object> get props => [message];
}

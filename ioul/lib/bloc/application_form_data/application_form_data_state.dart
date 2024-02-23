import '../../model/model.dart';
import '../../packages/package.dart';

abstract class ApplicationFormDataState extends Equatable {
  const ApplicationFormDataState();

  @override
  List<Object> get props => [];
}

class ApplicationFormDataInitialState extends ApplicationFormDataState {
  @override
  List<Object> get props => [];
}

class ApplicationFormDataLoading extends ApplicationFormDataState {
  @override
  List<Object> get props => [];
}

class ApplicationFormDataLoaded extends ApplicationFormDataState {
  final ApplicationFormData formData;
  const ApplicationFormDataLoaded(this.formData);

  @override
  List<Object> get props => [formData];
}

class ApplicationFormDataFailure extends ApplicationFormDataState {
  final String message;
  const ApplicationFormDataFailure({required this.message});
  @override
  List<Object> get props => [message];
}

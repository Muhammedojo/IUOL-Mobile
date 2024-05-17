part of 'get_application_form_cubit.dart';

sealed class GetApplicationFormState extends Equatable {
  const GetApplicationFormState();

  @override
  List<Object> get props => [];
}

final class GetApplicationFormInitial extends GetApplicationFormState {}

final class GetApplicationFormLoading extends GetApplicationFormState {}

final class GetApplicationFormSuccess extends GetApplicationFormState {
  final ApplicationFormData data;
  const GetApplicationFormSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

final class GetApplicationFormError extends GetApplicationFormState {
  final String error;

  const GetApplicationFormError({required this.error});

  @override
  List<Object> get props => [error];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ioul/model/model.dart';
import 'package:ioul/provider/failure.dart';
import 'package:ioul/utils/global_states.dart';

part 'get_application_form_state.dart';

class GetApplicationFormCubit extends Cubit<GetApplicationFormState> {
  GetApplicationFormCubit() : super(GetApplicationFormInitial());

  getApplicationFormData() async {
    try {
      emit(GetApplicationFormLoading());
      final response = await repository.getApplicationFormData();
      response.fold(
          (l) => emit(GetApplicationFormError(error: l.failureMessage())),
          (r) => emit(GetApplicationFormSuccess(data: r.data!)));
    } on Failure catch (e) {
      emit(GetApplicationFormError(error: e.failureMessage()));
    } catch (e) {
      emit(GetApplicationFormError(error: e.toString()));
    }
  }
}

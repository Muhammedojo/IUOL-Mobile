import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ioul/model/model.dart';
import 'package:ioul/response/response.dart';
import 'package:meta/meta.dart';

import '../../packages/package.dart';
import '../../utils/global_states.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailInitialState());

  pushPinToServer(VerifyEmail data) async {
    try {
      emit(VerifyEmailLoading());
      final response =
          await repository.resetPassword(data.pin ?? "", data.email ?? "");
      log("response body first: ${response.data}");
      if (response.isConnectionSuccessful()) {
        emit(VerifyEmailLoaded(response));
      } else {
        log("response error body: ${response.responseMessage}");
        emit(VerifyEmailFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(VerifyEmailFailure(message: e.toString()));
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ioul/model/make_payment.dart';
import 'package:ioul/provider/failure.dart';
import 'package:ioul/utils/global_states.dart';

part 'make_payment_state.dart';

class MakePaymentCubit extends Cubit<MakePaymentState> {
  MakePaymentCubit() : super(MakePaymentInitial());

  makePayment(MakePaymentData data) async {
    try {
      emit(MakePaymentLoading());
      final response = await repository.makePayment(data);
      response.fold((l) => emit(MakePaymentError(error: l.failureMessage())),
          (r) => emit(MakePaymentSuccess(data: r.data!)));
    } on Failure catch (e) {
      emit(MakePaymentError(error: e.failureMessage()));
    } catch (e) {
      emit(MakePaymentError(error: e.toString()));
    }
  }
}

import 'package:ioul/core/bloc/payment_history/cubit.dart';
import '../core/core.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/payment_history_controller.dart';
import '../core/utils/mvc.dart';

class PaymentHistoryView
    extends StatelessView<PaymentHistory, PaymentHistoryController> {
  const PaymentHistoryView(PaymentHistoryController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        //AppColors.backgroundWhite,
        appBar: WidgetHelper().appBackArrowWithTitle(context,
            title: 'payment_history'.tr(), onTap: () => state.onBackPressed()),
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return SingleChildScrollView(
        child: Padding(
      padding: REdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<PaymentHistoryCubit, PaymentHistoryState>(
            builder: (context, stateBloc) {
              if (stateBloc is PaymentHistoryLoading) {
                return const Loader();
              } else if (stateBloc is PaymentHistoryLoaded) {
                return stateBloc.paymentHistoryList.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          color: Color(0xff000000),
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: stateBloc.paymentHistoryList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var history = stateBloc.paymentHistoryList[index];
                          return PaymentHistoryWidget(
                            onTap: () {
                              state.showPaymentDetails(history);
                            },
                            paymentHistory: history,
                          );
                        },
                      )
                    : ErrorItemWidget(
                        title: "empty_list".tr(),
                        message: "no_payment_history".tr(),
                        hideButton: false,
                        onTap: () {
                          state.refresh();
                        },
                      );
              }
              return ErrorItemWidget(
                title: "error_occurred".tr(),
                message: "no_payment_history".tr(),
                hideButton: false,
                onTap: () {
                  state.refresh();
                },
              );
            },
          ),
        ],
      ),
    ));
  }
}

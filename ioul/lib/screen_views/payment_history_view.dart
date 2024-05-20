import 'package:ioul/bloc/payment_history/cubit.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/payment_history_controller.dart';
import 'stateless_view.dart';

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
            title: 'Payment History', onTap: () => state.onBackPressed()),
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
            builder: (context, states) {
              if (state is PaymentHistoryLoading) {
                const Loader();
              } else if (states is PaymentHistoryLoaded) {
                return states.paymentHistoryList.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          color: Color(0xff000000),
                        ),
                        itemCount: states.paymentHistoryList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var history = states.paymentHistoryList[index];
                          return PaymentHistoryWidget(
                            onTap: () {},
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

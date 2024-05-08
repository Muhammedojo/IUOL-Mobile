import 'package:h3m_shimmer_card/h3m_shimmer_card.dart';
import 'package:ioul/bloc/bloc.dart';
import 'package:ioul/bloc/payment_history/cubit.dart';

import '../helpers/helper.dart';
import '../packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/payment_history_controller.dart';
import '../values/values.dart';
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
                return const CircularProgressIndicator();
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
                    : const Center(child: Text('Empty'));
              }
              return Center(
                child: InkWell(
                  onTap: () =>
                      state.paymentHistCubit.loadPaymentHistoryFromServer(),
                  child: Container(
                    width: 100, // Set the width of the container
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Refresh',
                        style: Styles.x18dp_202326_700w(),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}

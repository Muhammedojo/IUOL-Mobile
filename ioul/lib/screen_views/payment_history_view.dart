import 'package:h3m_shimmer_card/h3m_shimmer_card.dart';
import 'package:ioul/bloc/bloc.dart';
import 'package:ioul/bloc/payment_history/cubit.dart';

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
    return Container(
      height: 50.h,
      color: const Color(0xff25435B),
      child: SafeArea(
        right: false,
        left: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.backgroundWhite,
            body: WidgetWrapper(child: _body(context))),
      ),
    );
  }

  Widget _body(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xff25435B), Color(0xff2799F7)]),
              ),
              height: 120.h,
              alignment: Alignment.centerLeft,
              padding: REdgeInsets.only(left: 24),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => state.onBackPressed(),
                        child: Container(
                          width: 36.w,
                          height: 36.h,
                          constraints:
                              BoxConstraints(maxHeight: 36.h, maxWidth: 36.w),
                          margin: REdgeInsets.only(top: 8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Payment History',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
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
                    return CircularProgressIndicator();
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // background color
                        foregroundColor: Colors.white, // text color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8), // button padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              16.0), // button border radius
                        ),
                      ),
                      onPressed: () =>
                          state.paymentHistCubit.loadPaymentHistoryFromServer(),
                      child: Text('Refresh'),
                    ),
                  );
                },
              ),
            ],
          ),
        ))),
      ],
    );
  }
}

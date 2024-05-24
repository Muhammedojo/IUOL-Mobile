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
            height: 10.h,
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         decoration: BoxDecoration(
          //             border: Border.all(color: const Color(0xffD1D5DB)),
          //             borderRadius: BorderRadius.circular(8.r),
          //             color: const Color(0xffD1D5DB).withOpacity(0.2)),
          //         child: TextFormField(
          //           style: TextStyle(
          //               color: const Color(0xff000000),
          //               fontFamily: Styles.font,
          //               fontSize: 12.sp),
          //           //controller: state.searchController,
          //           onChanged: (value) {
          //             context.read<PaymentHistoryCubit>().filterItems(value);
          //           },
          //           autofocus: false,
          //           decoration: InputDecoration(
          //             border: InputBorder.none,
          //             focusedBorder: InputBorder.none,
          //             prefixIcon: SvgPicture.asset(
          //               'assets/images/search.svg',
          //               color: const Color(0xff000000),
          //               width: 16.w,
          //               height: 16.w,
          //               fit: BoxFit.scaleDown,
          //             ),
          //             hintText: "search".tr(),
          //             hintStyle: TextStyle(
          //                 fontSize: 16.sp,
          //                 fontWeight: FontWeight.w400,
          //                 fontFamily: Styles.font,
          //                 color: const Color(0xff6C7072)),
          //             //onChanged: searchOperation,
          //           ),
          //           textInputAction: TextInputAction.search,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

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
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: states.paymentHistoryList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var history = states.paymentHistoryList[index];
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

import 'package:ioul/values/values.dart';

import '../model/model.dart';
import '../packages/package.dart';

class PaymentHistoryWidget extends StatelessWidget {
  final PaymentsHistory paymentHistory;
  final Function()? onTap;

  const PaymentHistoryWidget({
    Key? key,
    required this.onTap,
    required this.paymentHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime paymentDate = DateTime.parse('${paymentHistory.date}');
    final String formattedDate = DateFormat('dd-MM-yyyy').format(paymentDate);
    final double amount = double.parse('${paymentHistory.amount}');
    final String formattedAmount =
        NumberFormat.currency(symbol: "₦", decimalDigits: 2).format(amount);

    return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.transparent
              //AppColors.lightBlue,
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                paymentHistory.status == 'successful'
                    ? 'assets/images/success_pay.svg'
                    : (paymentHistory.status == 'pending'
                        ? 'assets/images/pending_payment.svg'
                        : 'assets/images/cancel_pay.svg'),
                fit: BoxFit.scaleDown,
                height: 35.w,
                width: 35.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${paymentHistory.paymentType}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: Styles.font,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff090A0A),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '${paymentHistory.name}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Styles.font,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff72777A),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '${paymentHistory.transactionId}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Styles.font,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff72777A),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formattedAmount,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: Styles.font,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff202325),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '${paymentHistory.status}',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: Styles.font,
                        fontWeight: FontWeight.w500,
                        color: paymentHistory.status == 'successful'
                            ? const Color(0xff23C16B)
                            : (paymentHistory.status == 'pending'
                                ? const Color(0xffFFB323)
                                : const Color(0xffFF5247))),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Styles.font,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff72777A),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

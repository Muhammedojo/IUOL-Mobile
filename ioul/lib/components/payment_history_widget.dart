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
    return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.transparent
              //AppColors.lightBlue,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    //  'assets/images/pending_payment.svg',
                    paymentHistory.status == 'successful'
                        ? 'assets/images/success_pay.svg'
                        : (paymentHistory.status == 'pending'
                            ? 'assets/images/pending_payment.svg'
                            : 'assets/images/cancel_pay.svg'),
                    fit: BoxFit.scaleDown,
                    height: 24.w,
                    width: 24.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      '${paymentHistory.name}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff090A0A),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    '${paymentHistory.amount}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff202325),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 34.w,
                  ),
                  Expanded(
                    child: Text(
                      '${paymentHistory.date}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff72777A),
                      ),
                    ),
                  ),
                  Text(
                    '${paymentHistory.status}',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: paymentHistory.status == 'successful'
                            ? const Color(0xff23C16B)
                            : (paymentHistory.status == 'pending'
                                ? const Color(0xffFFB323)
                                : const Color(0xffFF5247))),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

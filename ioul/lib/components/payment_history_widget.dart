import '../packages/package.dart';

class PaymentHistoryWidget extends StatelessWidget {
  final String? amount;
  final String? title;
  final String? time;
  final String? status;
  final Function()? onTap;

  const PaymentHistoryWidget({
    Key? key,
    required this.title,
    required this.amount,
    required this.time,
    required this.status,
    required this.onTap,
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SvgPicture.asset(
                      //  'assets/images/pending_payment.svg',
                        status == 'Completed'
                            ?  'assets/images/success_pay.svg'
                            : (status == 'Pending'
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
                          '$title',
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
                        '$amount',
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
                          '$time',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff72777A),
                          ),
                        ),
                      ),
                      Text(
                        '$status',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: status == 'Completed'
                                ? const Color(0xff23C16B)
                                : (status == 'Pending'
                                    ? const Color(0xffFFB323)
                                    : const Color(0xffFF5247))
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Color(0xff000000),
              )
            ],
          ),
        ));
  }
}

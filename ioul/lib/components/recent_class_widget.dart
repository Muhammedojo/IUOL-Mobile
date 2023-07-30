import '../values/values.dart';
import '../packages/package.dart';

class RecentClassWidget extends StatelessWidget {
  final String? code;
  final String? title;
  final Function()? onTap;

  const RecentClassWidget({
    Key? key,
    required this.title,
    required this.code,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.lightBlue,
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 18.0,horizontal: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      '$code',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
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
                    Text(
                      '$title',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff202325),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

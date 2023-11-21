import '../packages/package.dart';

class TestStatusWidget extends StatelessWidget {
  final String? unit;
  final String? title;
  final String? index;
  final String? status;
  final Function()? onTap;

  const TestStatusWidget({
    Key? key,
    required this.title,
    required this.unit,
    required this.index,
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
              color: Colors.transparent),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  '$index',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff202325),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$title',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff090A0A),
                      ),
                    ),
                    Text(
                      '$unit',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff72777A),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: const Color(0xffC9F0FF)),
                  child: Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Text(
                      '$status',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff202325),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

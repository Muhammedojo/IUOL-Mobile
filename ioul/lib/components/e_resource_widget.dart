import '../packages/package.dart';

class EResourceWidget extends StatelessWidget {
  final Function()? onTap;
  final String? tittle;

  const EResourceWidget({Key? key, required this.onTap, this.tittle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(0.5, 0.5), // shadow direction: bottom right
            ),
          ],
        ),
        child: Padding(
          padding: REdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$tittle',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff090A0A)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$tittle',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff303437)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '../packages/package.dart';

class TestWidget extends StatelessWidget {
  final Function()? onTap;
  const TestWidget({Key? key, required this.onTap}) : super(key: key);

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
              blurRadius: 3.0,
              spreadRadius: 0.0,
              offset: Offset(1.0, 1.0), // shadow direction: bottom right
            ),
          ],
        ),
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
          child: Row(
            children: [
              SvgPicture.asset('assets/images/test_icon.svg',fit: BoxFit.scaleDown,),
              SizedBox(
                width: 25.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Test 1',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      )
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Test 1',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      )
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Test 1',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      )
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Test 1',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48.r),
                        color: const Color(0xff25435B)
                    ),
                    child: Padding(
                      padding: REdgeInsets.symmetric(horizontal: 50,vertical: 15),
                      child: Text(
                        'Start Test',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            color: const Color(0xffffffff)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

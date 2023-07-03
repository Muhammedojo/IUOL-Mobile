import '../packages/package.dart';

class TaskStatusWidget extends StatelessWidget {
  final Function()? onTap;
  const TaskStatusWidget({Key? key, required this.onTap}) : super(key: key);

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
          padding: REdgeInsets.symmetric(vertical: 24.0, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ARB 111 - Introduction to Arabic Language',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Inter',
                        color: const Color(0xff000000)),
                  )
                ],
              ),
              SizedBox(
                height: 15.w,
              ),
              const Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 15.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Start Date',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter',
                                color: const Color(0xff000000)),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/calendar.svg',
                            height: 24.w,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(width: 4.w,),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '9:30 am, June 16, 2023',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff000000)),
                              ),
                              SizedBox(height: 8.h,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(39.r),
                                    color:const Color(0xffC9F0FF)

                                ),
                                child: Padding(
                                  padding:
                                  REdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                  child: Text(
                                    '15 days ago',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Inter',
                                        color:const Color(0xff000000)

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'End Date',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff000000)),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/calendar.svg',
                            height: 24.w,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(width: 4.w,),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '9:30 am, Aug 19, 2023',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff000000)),
                              ),
                              SizedBox(height: 8.h,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(39.r),
                                    color:const Color(0xffFFE5E5)

                                ),
                                child: Padding(
                                  padding:
                                  REdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                  child: Text(
                                    '2 days from now',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Inter',
                                        color:const Color(0xffFF6D6D)

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ioul/packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/dashboard_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class DashboardView extends StatelessView<Dashboard, DashboardController> {
  const DashboardView(DashboardController state, {Key? key})
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
            appBar: AppBar(
              // backgroundColor: const Color(0xff25435B),
              centerTitle: true,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(100.0.h),
                  child: const SizedBox()),
              flexibleSpace: Container(
                //color: Color(0xff2799F7),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Color(0xff25435B), Color(0xff2799F7)]),
                ),
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 25.r,
                              child: ClipOval(
                                child: Image.network(
                                  '',
                                  fit: BoxFit.cover,
                                  height: 35.w,
                                  width: 35.w,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Image.asset(
                                      'assets/images/iconic_logo.png',
                                      width: 32.w,
                                      height: 32.w,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          SvgPicture.asset('assets/images/bell.svg',
                              fit: BoxFit.scaleDown)
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Hi, Sulaimon Adili',
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                            color: const Color(0xffffffff)),
                      ),
                      Text(
                        '200 level, Department of Electrical Engineering',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            color: const Color(0xffffffff)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: WidgetWrapper(child: _body())),
      ),
    );
  }

  Widget _body() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(14.r),
                            bottomRight: Radius.circular(14.r)),
                        color: const Color(0xff90CDFF)),
                    child: Padding(
                      padding: REdgeInsets.all(7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/images/camp.svg',
                            height: 16.w,
                            width: 16.w,
                            fit: BoxFit.scaleDown,
                          ),
                          Text(
                              'Iconic University of Open Learning is now Accredited',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Inter',
                                  color: const Color(0xff000026))),
                          Text('1/6',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Inter',
                                  color: const Color(0xff000026)))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: CardWidget(
                          title: 'Enrolled Course',
                          number: '12',
                          onTap: null,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Expanded(
                        child: CardWidget(
                          title: 'Calendar',
                          number: '18',
                          onTap: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: CardWidget(
                          title: 'Virtual Library',
                          number: '12',
                          onTap: null,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Expanded(
                        child: CardWidget(
                          title: 'Resources',
                          number: '18',
                          onTap: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Recent class',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: const Color(0xff202325))),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 80.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        const RecentClassWidget(
                          title: 'Introduction to Arabic Language I',
                          code: 'ARB 111',
                          onTap: null,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        const RecentClassWidget(
                          title: 'Introduction to Chemistry',
                          code: 'CHM 141',
                          onTap: null,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        const RecentClassWidget(
                          title: 'General Studies',
                          code: 'GNS 101',
                          onTap: null,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        const RecentClassWidget(
                          title: 'MAthematics',
                          code: 'MTH 111',
                          onTap: null,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Upcoming Tasks and Assignment',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: const Color(0xff202325))),
                  SizedBox(
                    height: 20.h,
                  ),
                  const EnrolledCourseWidget(onTap: null),
                  SizedBox(
                    height: 10.h,
                  ),
                  const EnrolledCourseWidget(onTap: null),
                  SizedBox(
                    height: 10.h,
                  ),
                  const EnrolledCourseWidget(onTap: null),
                  SizedBox(
                    height: 10.h,
                  ),
                  const EnrolledCourseWidget(onTap: null),
                  SizedBox(
                    height: 10.h,
                  ),
                  const EnrolledCourseWidget(onTap: null),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

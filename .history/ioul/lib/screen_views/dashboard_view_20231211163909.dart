import 'package:ioul/screens_controllers/profile.dart';
import 'package:ioul/utils/utils.dart';

import '../helpers/helper.dart';
import '../packages/package.dart';
import '../components/components.dart';
import '../router/router.dart';
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
            backgroundColor: AppColors.skyLightest,
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
                            onTap: () {
                              NavigatorHelper(context).pushNamedScreen(
                                RouteConstants.userProfile,
                              );
                            },
                            child: ClipOval(
                              child: Image.network(
                                'https://www.essence.com/wp-content/uploads/2020/12/GettyImages-957598612-scaled.jpg',
                                fit: BoxFit.cover,
                                height: 54.w,
                                width: 54.w,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.asset(
                                    'assets/images/iconic_logo.png',
                                    width: 54.w,
                                    height: 54.w,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              NavigatorHelper(context).pushNamedScreen(
                                RouteConstants.notification,
                              );
                            },
                            child: SvgPicture.asset('assets/images/bell.svg',
                                fit: BoxFit.scaleDown),
                          )
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
            body: WidgetWrapper(child: _body(context))),
      ),
    );
  }

  Widget _body(context) {
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
                  InkWell(
                    onTap: () => NavigatorHelper(context).pushNamedScreen(
                      RouteConstants.notification,
                    ),
                    child: Container(
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
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 15.w,
                      ),
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const RecentClassWidget(
                        title: 'Introduction to Arabic Language I',
                        code: 'ARB 111',
                        onTap: null,
                      ),
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
                  const UpcomingTaskWidget(
                    onTap: null,
                    course: 'CMP 111 - Introduction to Computer Science',
                    date: '2/08/2023',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const UpcomingTaskWidget(
                    onTap: null,
                    course: 'CHM 101 - Introduction to Chemistry II',
                    date: '4/08/2023',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const UpcomingTaskWidget(
                    onTap: null,
                    course: 'SOS 111 - Introduction to Social Science',
                    date: '5/08/2023',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const UpcomingTaskWidget(
                    onTap: null,
                    course: 'CMP 111 - Introduction to Computer Science',
                    date: '6/08/2023',
                  ),
                  SizedBox(
                    height: 10.h,
                  ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>Text("data")
                    // const UpcomingTaskWidget(
                    //   onTap: null,
                    //   course: 'CMP 111 - Introduction to Computer Science',
                    //   date: '2/08/2023',
                    // ),
                  ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

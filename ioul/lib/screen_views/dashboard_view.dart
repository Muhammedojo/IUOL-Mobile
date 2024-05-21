import '../bloc/bloc.dart';
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
                  preferredSize: Size.fromHeight(71.0.h),
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
                          BlocBuilder<UserCubit, UserState>(
                              builder: (context, stateBloc) {
                            if (stateBloc is UserLoaded) {
                              return InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                      RouteConstants.userProfile,
                                    );
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                    child: Center(
                                      child: Image.network(
                                        width: 38,
                                        height: 38,
                                        '${stateBloc.login.user?.imageUrl}',
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        (loadingProgress
                                                                .expectedTotalBytes ??
                                                            1)
                                                    : null,
                                              ),
                                            );
                                          }
                                        },
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return Text(
                                            state.extractLetters(
                                                '${stateBloc.login.fullName()}'),
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: Styles.font,
                                                color: const Color(0xffffffff)),
                                          );
                                        },
                                      ),
                                    ),
                                  ));
                            }
                            return Text(
                              '',
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: Styles.font,
                                  color: const Color(0xffffffff)),
                            );
                          }),
                          InkWell(
                            onTap: () => state.notificationPage(),
                            child: SvgPicture.asset('assets/images/bell.svg',
                                fit: BoxFit.scaleDown),
                          )
                        ],
                      ),
                      SizedBox(height: 16.h),
                      BlocBuilder<UserCubit, UserState>(
                          builder: (context, stateBloc) {
                        if (stateBloc is UserLoaded) {
                          return Text(
                            'Hi, ${stateBloc.login.fullName() ?? ''}',
                            style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: Styles.font,
                                height: 32.00 / 24.0,
                                color: const Color(0xffffffff)),
                          );
                        }
                        return Text(
                          '',
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: Styles.font,
                              color: const Color(0xffffffff)),
                        );
                      }),
                      BlocBuilder<UserCubit, UserState>(
                          builder: (context, stateBloc) {
                        if (stateBloc is UserLoaded) {
                          return Text(
                            '${stateBloc.login.level()} ${stateBloc.login.department()}',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: Styles.font,
                                height: 20.00 / 14.0,
                                color: const Color(0xffffffff)),
                          );
                        }
                        return Text(
                          '',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: Styles.font,
                              height: 20.00 / 14.0,
                              color: const Color(0xffffffff)),
                        );
                      }),
                      SizedBox(height: 9.h),
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
                                    fontFamily: Styles.font,
                                    color: const Color(0xff000026))),
                            Text('1/6',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Styles.font,
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
                      BlocBuilder<CoursesCubit, CoursesState>(
                          builder: (context, stateBloc) {
                        if (stateBloc is CoursesLoaded) {
                          return Expanded(
                            child: CardWidget(
                              title: 'enrolled_course'.tr(),
                              number: '${stateBloc.courseList.length}',
                              onTap: null,
                            ),
                          );
                        }
                        return Expanded(
                          child: CardWidget(
                            title: 'enrolled_course'.tr(),
                            number: '0',
                            onTap: null,
                          ),
                        );
                      }),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: CardWidget(
                          title: 'calendar'.tr(),
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
                      Expanded(
                        child: CardWidget(
                          title: 'virtual_library'.tr(),
                          number: '12',
                          onTap: null,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: CardWidget(
                          title: 'resources'.tr(),
                          number: '18',
                          onTap: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('recent_class'.tr(),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: Styles.font,
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
                  Text('upcoming_task_assignment'.tr(),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: Styles.font,
                          color: const Color(0xff202325))),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => const UpcomingTaskWidget(
                      onTap: null,
                      course: 'CMP 111 - Introduction to Computer Science',
                      date: '2/08/2023',
                    ),
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

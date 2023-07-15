import '../helpers/helper.dart';
import '../packages/package.dart';
import '../router/router.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/course_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class CourseView extends StatelessView<Course, CourseController> {
  const CourseView(CourseController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.transparent,
         //AppColors.backgroundWhite,
        appBar: AppBar(
          // backgroundColor: const Color(0xff25435B),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize:Size.fromHeight(40.0.h),
              child: const SizedBox()
          ),
          title:  Text(
            'Enrolled Courses',style: TextStyle(fontSize: 18.sp,fontFamily: 'Inter',
              fontWeight: FontWeight.w700),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xff25435B), Color(0xff2799F7)]),
            ),

          ),
        ),
        body: WidgetWrapper(child: _body(context)));
  }

   Widget _body(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Container(
          //   color: const Color(0xff25435B),
          //   height: 80.h,
          //   alignment: Alignment.centerLeft,
          //   padding: REdgeInsets.only(left: 24),
          //   width: double.infinity,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //         Text(
          //                'Enrolled Courses',style: TextStyle(fontSize: 18.sp,fontFamily: 'Inter',
          //                fontWeight: FontWeight.w700),),
          //
          //     ],
          //   ),
          // ),
        ],
      ),
      Expanded(
        child: SingleChildScrollView( 
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                EnrolledCourseWidget(onTap:() => NavigatorHelper(context).pushNamedScreen(
                  RouteConstants.courseDetailOverview,
                )),
                SizedBox(height: 10.h,),
                const EnrolledCourseWidget(onTap: null),
                SizedBox(height: 10.h,),
                const EnrolledCourseWidget(onTap: null),
                SizedBox(height: 10.h,),
                const EnrolledCourseWidget(onTap: null),
                SizedBox(height: 10.h,),
                const EnrolledCourseWidget(onTap: null),
                SizedBox(height: 10.h,),
                const EnrolledCourseWidget(onTap: null),
                SizedBox(height: 10.h,),
                const EnrolledCourseWidget(onTap: null),
                SizedBox(height: 10.h,),
                const EnrolledCourseWidget(onTap: null),
                SizedBox(height: 10.h,),
                const EnrolledCourseWidget(onTap: null),
                SizedBox(height: 10.h,),
                const EnrolledCourseWidget(onTap: null),
                SizedBox(height: 10.h,),
                const EnrolledCourseWidget(onTap: null),
              ],
            ),
          ),
        ),
      ),

    ]);
  }


}

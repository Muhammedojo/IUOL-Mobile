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
    return Container(
      height: 50.h,
      color: const Color(0xff25435B),
      child: SafeArea(
        right: false,
        left: false,
        bottom: false,
        child: Scaffold(
             backgroundColor: AppColors.backgroundWhite,
            // appBar: AppBar(
            //     backgroundColor: const Color(0xff25435B),
            //     centerTitle: true,
            //     bottom: PreferredSize(
            //         preferredSize:Size.fromHeight(40.0.h),
            //     child: const SizedBox()
            //     ),
            //     title:  Text(
            //       'Enrolled Courses',style: TextStyle(fontSize: 18.sp,
            //       fontWeight: FontWeight.w700),
            //     )),
            body: WidgetWrapper(child: _body(context))),
      ),
    );
  }

   Widget _body(context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          color: const Color(0xff25435B),
          height: 80.h,
          alignment: Alignment.centerLeft,
          padding: REdgeInsets.only(left: 24),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GestureDetector(
              //   onTap: () => state.onBackPressed(),
              //   child: Container(
              //     width: 36.w,
              //     height: 36.h,
              //     constraints: BoxConstraints(maxHeight: 36.h, maxWidth: 36.w),
              //     margin: REdgeInsets.only(top: 8),
              //     decoration: const BoxDecoration(
              //       color: Colors.white,
              //       shape: BoxShape.circle,
              //     ),
              //     child: const Icon(
              //       Icons.arrow_back,
              //       color: Colors.black54,
              //     ),
              //   ),
              // ),
                Text(
                       'Enrolled Courses',style: TextStyle(fontSize: 18.sp,
                       fontWeight: FontWeight.w700),),

            ],
          ),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.h,
              ),
              EnrolledCourseWidget(onTap:() => NavigatorHelper(context).pushNamedScreen(
                RouteConstants.assignmentPreview,
              )),
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

      ]),
    );
  }


}

import 'package:flutter/material.dart';
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
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
            backgroundColor: const Color(0xff25435B),
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize:Size.fromHeight(40.0.h),
            child: const SizedBox()
            ),
            title:  Text(
              'Enrolled Courses',style: TextStyle(fontSize: 18.sp,
              fontWeight: FontWeight.w700),
            )),
        body: WidgetWrapper(child: _body(context)));
  }

   Widget _body(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.all(10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 20.h,
          ),
           EnrolledCourseWidget(onTap:() => NavigatorHelper(context).pushNamedScreen(
            RouteConstants.documentResources,
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

        ]),
      ),
    );
  }


}

import '../packages/package.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/assignment_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class AssignmentView extends StatelessView<Assignment, AssignmentController> {
  const AssignmentView(AssignmentController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
           // backgroundColor: const Color(0xff25435B),
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize:Size.fromHeight(40.0.h),
                child: const SizedBox()
            ),
            title:  Text(
              '2023 Spring Semester Assignment',style: TextStyle(fontSize: 18.sp,fontFamily: 'Inter',
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
        body: _body(context));
  }
  Widget _body(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.all(10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 20.h,
          ),
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

import '../bloc/bloc.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../router/router.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/course_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class CourseView extends StatelessView<Course, CourseController> {
  const CourseView(CourseController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // backgroundColor: const Color(0xff25435B),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0.h), child: const SizedBox()),
          title: Text(
            'Enrolled Courses',
            style: Styles.x18dp_202326_700w(),
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
      const Column(
        mainAxisSize: MainAxisSize.min,
        children: [],
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
                BlocBuilder<CoursesCubit, CoursesState>(
                    builder: (context, stateBloc) {
                  if (stateBloc is CoursesLoading) {
                    return const Loader();
                  } else if (stateBloc is CoursesLoaded) {
                    return stateBloc.courseList.isNotEmpty
                        ? ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10.h,
                                ),
                            itemCount: stateBloc.courseList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var courses = stateBloc.courseList[index];
                              return EnrolledCourseWidget(
                                onTap: () =>
                                    NavigatorHelper(context).pushNamedScreen(
                                  RouteConstants.courseDetailOverview,
                                ),
                                course: courses,
                              );
                            })
                        : ErrorItemWidget(
                            title: "Empty List",
                            message: "Course List is empty",
                            hideButton: false,
                            onTap: () {
                              state.refresh();
                            },
                          );
                  }
                  return ErrorItemWidget(
                    title: "Error occurred",
                    message: "Couldn't fetch courses",
                    hideButton: false,
                    onTap: () {
                      state.refresh();
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

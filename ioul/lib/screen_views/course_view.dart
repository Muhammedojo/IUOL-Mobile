import '../core/core.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/course_controller.dart';
import '../core/utils/mvc.dart';

class CourseView extends StatelessView<Courses, CourseController> {
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
            'enrolled_course'.tr(),
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
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var courses = stateBloc.courseList[index];
                              return EnrolledCourseWidget(
                                onTap: () => state.showCourseDetails(courses),
                                course: courses,
                              );
                            })
                        : ErrorItemWidget(
                            title: "empty_list".tr(),
                            message: "course_list_empty".tr(),
                            hideButton: false,
                            onTap: () {
                              state.refresh();
                            },
                          );
                  }
                  return ErrorItemWidget(
                    title: "error_occurred".tr(),
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

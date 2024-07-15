import '../core/core.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/add_drop_course_controller.dart';
import '../core/utils/mvc.dart';

class AddDropCourseView
    extends StatelessView<AddDropCourse, AddDropCourseController> {
  const AddDropCourseView(AddDropCourseController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Stack(children: [
      SafeArea(
          left: false,
          top: false,
          right: false,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              height: 205.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xff25435B), Color(0xff2799F7)]),
              ),
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => state.onBackPressed(),
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        constraints:
                            BoxConstraints(maxHeight: 36.h, maxWidth: 36.w),
                        margin: REdgeInsets.only(top: 8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'add_and_drop_course'.tr(),
                          style: Styles.x18dp_202326_700w(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: REdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                                  color: Colors.grey,
                                ),
                            itemCount: 7,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                //     const CourseRegWidget(
                                //   course: 'ARA 111 - Introduction to Arabic Language',
                                //   unit: '2 Units',
                                // ),
                                const SizedBox()),
                        SizedBox(
                          height: 30.h,
                        ),
                        SubmitButtonWidget(
                            label: 'preview'.tr(), onPressed: () {})
                      ],
                    )),
              ),
            )
          ])),
      Positioned(
          top: 187,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
              color: Color(0xff25435B),
            ),
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 7.0, vertical: 10),
              child: Text(
                '200/1000 Units',
                style: Styles.x14dp_090A0A_400w(),
              ),
            ),
          )),
    ]);
  }
}

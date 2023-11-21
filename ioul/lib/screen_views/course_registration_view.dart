import '../packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/course_registration_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class CourseRegistrationView
    extends StatelessView<CourseRegistration, CourseRegistrationController> {
  const CourseRegistrationView(CourseRegistrationController state, {Key? key})
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
                  children: [
                    Text(
                      '2023 Spring Semester Course Registration',
                      style: Styles.x18dp_202326_700w(),
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
                          itemCount: 8,
                          itemBuilder: (context, index) =>
                              const CourseRegWidget(
                            course: 'ARA 111 - Introduction to Arabic Language',
                            unit: '2 Units',
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SubmitButtonWidget(label: 'Submit', onPressed: () {})
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

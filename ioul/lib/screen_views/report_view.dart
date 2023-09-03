import '../helpers/helper.dart';
import '../packages/package.dart';
import '../router/router.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/report_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class ReportView extends StatelessView<Report, ReportController> {
  const ReportView(ReportController state, {Key? key}) : super(state, key: key);

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
            '2023 Spring Semester Report',
            style:
            Styles.x18dp_202326_700w(),
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
           EnrolledCourseWidget(onTap: () =>  NavigatorHelper(context).pushNamedScreen(
            RouteConstants.reportPreview,
          )),
          SizedBox(
            height: 10.h,
          ),
          const EnrolledCourseWidget(onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const EnrolledCourseWidget(onTap: null),

        ]),
      ),
    );
  }
}

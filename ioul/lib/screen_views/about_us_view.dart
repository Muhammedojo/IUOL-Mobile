import '../components/components.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/about_us_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class AboutUsView extends StatelessView<AboutUs, AboutUsController> {
  const AboutUsView(AboutUsController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper().appBackArrowWithTitle(context,
            title: 'about_us'.tr(), onTap: () => state.onBackPressed()),
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Text(
              'WHY CHOOSE ICONIC UNIVERSITY?',
              style: Styles.x16dp_202325_700w(),
            ),
            Text(
              '''

Iconic University is a private open, distance, and e-Learning university approved by the National Universities Commission (NUC) in Nigeria to provide an advanced educational opportunity for prospective students hoping to get a degree in an array of courses. The university is headquartered in Sokoto State of Nigeria, with potential study centres across cities in Nigeria and beyond.

The Iconic Open University allows students to pursue programmes from their comfort zone by delivering theoretical learning online and practical learning experiences at face-to-face learning centres. It gives the advantage for students’ placement as apprentices in the industry that is relevant to their careers, thereby acquiring skills, technical knowledge, and industry-based experience. It also allows working-class individuals to acquire knowledge, skills, and techniques relevant to their present work situation or future career prospects.

Thus, Iconic Open University provides an opportunity to upgrade academic qualifications without giving up jobs or relationships while being domiciled in the workplace. The university system affords students study from any location in the globe. The university system is also flexible regarding age and time, allowing for enrolment at any time and the convenience of pace dictated by the student.
''',
              style: Styles.x12dp_090A0A_400w(),
            )
          ],
        ),
      ),
    );
  }
}

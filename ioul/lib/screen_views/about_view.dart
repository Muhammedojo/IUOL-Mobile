import '../packages/package.dart';
import '../components/components.dart';
import '../helpers/helper.dart';
import '../screens/screens.dart';
import '../screens_controllers/about_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class AboutView extends StatelessView<About, AboutController> {
  const AboutView(AboutController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper().appBackArrowWithTitle(context, title: 'About'),
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
      child:  SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min,children: [
          const AboutUsWidget(title: 'About  iUOL',),
          SizedBox(height: 20.h,),
          const AboutUsWidget(title: 'Terms and Conditions',),
          SizedBox(height: 20.h,),
          const AboutUsWidget(title: 'Privacy Policies',),
        ],),
      ),
    );
  }
}

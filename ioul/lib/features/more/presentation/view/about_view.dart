import '../../../../components/components.dart';
import '../../../../screens/screens.dart';
import '../../../../core/core.dart';
import '../../../../core/utils/mvc.dart';

class AboutView extends StatelessView<About, AboutController> {
  const AboutView(AboutController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper()
            .appBackArrowWithTitle(context, title: 'about'.tr(), onTap: () {
          state.onBackPressed();
        }),
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AboutUsWidget(
                title: 'About  iUOL',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutUs()),
                    )),
            SizedBox(
              height: 20.h,
            ),
            AboutUsWidget(
                title: 'Terms and Conditions',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TermsAndServices()),
                    )),
            SizedBox(
              height: 20.h,
            ),
            AboutUsWidget(
                title: 'Privacy Policies',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicy()),
                    )),
          ],
        ),
      ),
    );
  }
}

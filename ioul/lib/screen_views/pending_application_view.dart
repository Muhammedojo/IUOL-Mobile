import 'package:ioul/packages/package.dart';
import '../components/components.dart';
import 'package:ioul/screens_controllers/login_controller.dart';
import '../router/route_constants.dart';
import '../screens_controllers/pending_application_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class PendingApplicationView
    extends StatelessView<PendingApplication, PendingApplicationController> {
  const PendingApplicationView(PendingApplicationController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Check back later!',
                  style: Styles.x16dp_202325_400w(),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Your application is under process.',
                    style: Styles.x16dp_202325_400w(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 37,
            left: 0,
            right: 0,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButtonWidget(
                  title: "Login Page",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

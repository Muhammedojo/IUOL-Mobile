import 'package:flutter/material.dart';
import 'package:ioul/packages/package.dart';
import 'package:ioul/screens_controllers/login_controller.dart';
import '../components/components.dart';
import '../screens_controllers/review_application_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class ReviewApplicationView
    extends StatelessView<ReviewApplication, ReviewApplicationController> {
  const ReviewApplicationView(ReviewApplicationController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 140.h,
          ),
          Center(
            child: SvgPicture.asset(
              'assets/images/check.svg',
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            '''Congratulations!
     Your application has been submitted successfully, we will  evaluate your documents and notify you by email.''',
            style: Styles.x16dp_202325_400w(),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 230.h,
          ),
          ElevatedButtonWidget(
              title: "Login Page",
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  )),
        ],
      ),
    );
  }
}

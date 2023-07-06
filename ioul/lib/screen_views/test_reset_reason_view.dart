import '../components/components.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/test_reset_reason_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class TestResetReasonView
    extends StatelessView<TestResetReason, TestResetReasonController> {
  const TestResetReasonView(TestResetReasonController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: const Color(0xff25435B),
      child: SafeArea(
        right: false,
        left: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.backgroundWhite,
            body: WidgetWrapper(child: _body(context))),
      ),
    );
  }

  Widget _body(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: const Color(0xff25435B),
              height: 80.h,
              alignment: Alignment.centerLeft,
              padding: REdgeInsets.only(left: 24),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Test Reset Reason',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter'),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
                child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 35.h),
              Text(
                'Why do you need test rest?',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                    color: const Color(0xff090A0A)),
              ),
              TextFieldWidget(controller: state.resetReasonController,title: "The application",),
              SizedBox(height: 50.h,),
              ElevatedButtonWidget( onTap: (){}, title: 'Submit Application',)
            ],
          ),
        )))
      ],
    );
  }
}

import '../packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/test_reset_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class TestResetView extends StatelessView<TestReset, TestResetController> {
  const TestResetView(TestResetController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
          // backgroundColor: const Color(0xff25435B),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0.h), child: const SizedBox()),
          title: Text(
            'Test Reset',
            style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700),
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
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => const TestResetWidget(
                course: 'CMP 111 - Introduction to Computer Science',
                unit: '2 unit'),
          ),
          SizedBox(
            height: 50.h,
          ),
          ElevatedButtonWidget(
            onTap: () {},
            title: 'Proceed',
          )
        ],
      ),
    );
  }
}

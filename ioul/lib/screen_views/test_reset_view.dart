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
          leading: GestureDetector(
            onTap: () => state.onBackPressed(),
            child: Container(
              width: 30.w,
              height: 30.h,
              constraints: BoxConstraints(maxHeight: 30.h, maxWidth: 30.w),
              margin: REdgeInsets.only(top: 8, left: 12),
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
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0.h), child: const SizedBox()),
          title: Text('Test Reset', style: Styles.x18dp_202326_700w()),
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
            shrinkWrap: true,
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

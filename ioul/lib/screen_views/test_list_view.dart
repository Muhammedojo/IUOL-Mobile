import 'package:ioul/packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class TestListView extends StatelessView<TestListView, TestListController> {
  const TestListView(TestListController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff25435B), Color(0xff2799F7)]),
          ),
          child: SafeArea(
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 18.0, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => state.onBackPressed(),
                          child: const Icon(Icons.arrow_back_ios,
                              color: Color(0xffffffff))),
                      Text('Test',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'Inter',
                              color: const Color(0xffF7F9FA),
                              fontWeight: FontWeight.w500)),
                      const SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Text("GST 111 - Communication in English",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Inter',
                              color: const Color(0xffFFFFFF),
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 180,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                //ThemeManager.of(context).colorWhite,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                )),
            child: SingleChildScrollView(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    TestWidget(
                      onTap: () {
                        state.goToTestBrief();
                      },
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TestWidget(
                      onTap: () {
                        state.goToTestBrief();
                      },
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TestWidget(
                      onTap: () {
                        state.goToTestBrief();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

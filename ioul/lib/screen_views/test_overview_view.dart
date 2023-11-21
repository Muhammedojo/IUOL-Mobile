import 'package:ioul/packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class TestOverviewView
    extends StatelessView<TestOverview, TestOverviewController> {
  const TestOverviewView(TestOverviewController state, {Key? key})
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
                  Text('Test',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          color: const Color(0xffF7F9FA),
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Text('Hello, Sulaimon',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              color: const Color(0xffFFFFFF),
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Text("Let's test your knowledge",
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
          top: 200,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                //ThemeManager.of(context).colorWhite,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  _tabSection(context),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text('All',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400)),
                ),
                Tab(
                  child: Text('Done',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400)),
                ),
                Tab(
                  child: Text('New',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400)),
                ),
                Tab(
                  child: Text('Unavailable',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400)),
                ),
              ]),
          SizedBox(
            height: 25.h,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              // Container(
              //   child: Text(
              //     "Home Body",
              //     style: TextStyle(
              //       fontSize: 16.sp,
              //       fontFamily: 'Inter',
              //       color: const Color(0xff000000),
              //     ),
              //   ),
              // ),
              // Container(
              //   child: Text(
              //     "Articles Body",
              //     style: TextStyle(
              //       fontSize: 16.sp,
              //       fontFamily: 'Inter',
              //       color: const Color(0xff000000),
              //     ),
              //   ),
              // ),
              // Container(
              //   child: Text(
              //     "User Body",
              //     style: TextStyle(
              //       fontSize: 16.sp,
              //       fontFamily: 'Inter',
              //       color: const Color(0xff000000),
              //     ),
              //   ),
              // ),
              allTest(),
              doneTest(),
              newTest(),
              unavailableTest()
            ]),
          ),
        ],
      ),
    );
  }

  Widget allTest() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Color(0xff72777A),
          ),
          itemCount: 4,
          itemBuilder: (context, index) => TestStatusWidget(
              title: 'CSE 111 - Computer Science',
              unit: '2 units',
              index: '1.',
              status: 'Done',
              onTap: () {
                state.goToTest();
              }),
        ),
      ],
    );
  }

  Widget doneTest() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Color(0xff72777A),
          ),
          itemCount: 2,
          itemBuilder: (context, index) => TestStatusWidget(
              title: 'CSE 111 - Computer Science',
              unit: '2 units',
              index: '1.',
              status: 'Done',
              onTap: () {
                state.goToTest();
              }),
        ),
      ],
    );
  }

  Widget newTest() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Color(0xff72777A),
          ),
          itemCount: 2,
          itemBuilder: (context, index) => TestStatusWidget(
              title: 'CSE 111 - Computer Science',
              unit: '2 units',
              index: '1.',
              status: 'Done',
              onTap: () {
                state.goToTest();
              }),
        ),
      ],
    );
  }

  Widget unavailableTest() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Color(0xff72777A),
          ),
          itemCount: 3,
          itemBuilder: (context, index) => TestStatusWidget(
              title: 'CSE 111 - Computer Science',
              unit: '2 units',
              index: '1.',
              status: 'Done',
              onTap: () {
                state.goToTest();
              }),
        ),
      ],
    );
  }
}

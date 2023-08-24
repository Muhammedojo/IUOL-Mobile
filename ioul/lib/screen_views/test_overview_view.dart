import 'package:flutter/material.dart';
import 'package:ioul/packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/test_overview_controller.dart';
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
              padding:REdgeInsets.symmetric(vertical: 18.0,horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Test',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          color: const Color(0xffF7F9FA),
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 30.h,),
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
                  SizedBox(height: 12.h,),
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
                  SizedBox(height: 22.h,),
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
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('data',style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500)),
                Text('data'),

              ],
            ),
          ),
        )
      ],
    );
  }
}

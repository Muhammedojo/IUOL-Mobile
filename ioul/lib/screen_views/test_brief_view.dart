import '../packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class TestBriefView extends StatelessView<TestBriefView, TestBriefController> {
  const TestBriefView(TestBriefController state, {Key? key})
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
                      Text("Test 2",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Inter',
                              color: const Color(0xffFFFFFF),
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Text("GST 111 - Communication in English",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              color: const Color(0xffFFFFFF),
                              fontWeight: FontWeight.w500)),
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
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Brief explanation about this test',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Inter',
                              color: AppColors.brownBlack,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/questions.svg',
                          width: 40.w,
                          height: 40.w,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("10 Question",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Inter',
                                    color: AppColors.brownBlack,
                                    fontWeight: FontWeight.w700)),
                            Text("All questions carry equal mark",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'Inter',
                                    color: AppColors.lightBlack,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/duration.svg',
                          width: 40.w,
                          height: 40.w,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1 hour 15 min",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Inter',
                                    color: AppColors.brownBlack,
                                    fontWeight: FontWeight.w700)),
                            Text("Total duration of the quiz",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'Inter',
                                    color: AppColors.lightBlack,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Please read the text below carefully so you can understand it',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                                color: AppColors.brownBlack,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/dot.svg',
                          height: 6.w,
                          width: 6.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                              "1 mark awarded for a correct answer and no marks for an incorrect answer.",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  color: AppColors.brownBlack,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/dot.svg',
                          height: 6.w,
                          width: 6.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                              "Tap on options to select the correct answer.",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  color: AppColors.brownBlack,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/dot.svg',
                          height: 6.w,
                          width: 6.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                              "Click right arrow to move to the next question.",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  color: AppColors.brownBlack,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/dot.svg',
                          height: 6.w,
                          width: 6.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                              "Click left arrow to go back to the previous question.",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  color: AppColors.brownBlack,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/dot.svg',
                          height: 6.w,
                          width: 6.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                              "Click submit if you are sure you are done with test.",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  color: AppColors.brownBlack,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48.r),
                              color: const Color(0xff25435B)),
                          child: Padding(
                            padding:
                            REdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            child: Text(
                              'Start Test',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                  color: const Color(0xffffffff)),
                            ),
                          ),
                        ),
                      ),
                    ),
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

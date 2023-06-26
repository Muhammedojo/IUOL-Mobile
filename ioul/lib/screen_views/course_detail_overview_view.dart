import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/course_detail_overview_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class CourseOverviewView
    extends StatelessView<CourseOverview, CourseOverviewController> {
  const CourseOverviewView(CourseOverviewController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
            backgroundColor: const Color(0xff25435B),
            centerTitle: true,
            //leading: ,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(40.0.h),
                child: const SizedBox()),
            title: const Text('')),
        body: _body(context));
  }

  Widget _body(context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 19.0, vertical: 10.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const CourseInfoWidget(
          onTap: null,
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.withOpacity(0.1),
                    border: Border.all(color: Colors.transparent, width: 1)),
                child: ToggleSwitch(
                  minHeight: 30.h,
                  minWidth: 120.0.w,
                  cornerRadius: 5.0.r,
                  fontSize: 14.0.sp,
                  activeBgColors: const [
                    [Color(0xff25435B)],
                    [Color(0xff25435B)],
                  ],
                  activeFgColor: Colors.white,
                  customTextStyles: [TextStyle(fontSize: 12.sp)],
                  inactiveBgColor: Colors.transparent,
                  inactiveFgColor: Colors.black,
                  initialLabelIndex: state.selectedPage,
                  totalSwitches: 2,
                  labels: const ['Overview', 'Resources'],
                  radiusStyle: true,
                  onToggle: (index) {
                    state.onChipSelected(index!);
                  },
                )),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state.selectedPage == 0
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.backgroundWhite,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                                  ),
                                ],
                              ),

                              child: ExpansionTile(
                                title: Text(
                                  'Introduction',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff191C1C)),
                                ),
                                textColor: Colors.red,
                                children: [
                                  Padding(
                                    padding:REdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                                    child: Text(
                                      '''The aim and objective of this course is computer literacy. Information Technology is the frontier hero of the new century,driven by ambition and full courage, replicating itself like a virus and sweping all before it, So in order not to be marginalized ''',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: const Color(0xff000000), fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(height: 10.h,),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.backgroundWhite,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                                  ),
                                ],
                              ),

                              child: ExpansionTile(
                                title: Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff191C1C)),
                                ),
                                textColor: Colors.red,
                                children: [
                                  Padding(
                                    padding:REdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                                    child: Text(
                                      '''The aim and objective of this course is computer literacy. Information Technology is the frontier hero of the new century,driven by ambition and full courage, replicating itself like a virus and sweping all before it, So in order not to be marginalized ''',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: const Color(0xff000000), fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(height: 10.h,),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.backgroundWhite,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                                  ),
                                ],
                              ),

                              child: ExpansionTile(
                                title: Text(
                                  'Outline',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff191C1C)),
                                ),
                                textColor: Colors.red,
                                children: [
                                  Padding(
                                    padding:REdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                                    child: Text(
                                      '''The aim and objective of this course is computer literacy. Information Technology is the frontier hero of the new century,driven by ambition and full courage, replicating itself like a virus and sweping all before it, So in order not to be marginalized ''',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: const Color(0xff000000), fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(height: 10.h,),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.backgroundWhite,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                                  ),
                                ],
                              ),

                              child: ExpansionTile(
                                title: Text(
                                  'Interactive Class Time Table',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff191C1C)),
                                ),
                                textColor: Colors.red,
                                children: [
                                  Padding(
                                    padding:REdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                                    child: Text(
                                      '''The aim and objective of this course is computer literacy. Information Technology is the frontier hero of the new century,driven by ambition and full courage, replicating itself like a virus and sweping all before it, So in order not to be marginalized ''',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: const Color(0xff000000), fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(height: 10.h,)
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              ResourcesWidget(
                                onTap: null,
                                type: 'Document',
                                number: '12',
                                color: Color(0xffFFD188),
                                image: 'assets/images/documents.svg',
                              ),
                              ResourcesWidget(
                                onTap: null,
                                type: 'Videos',
                                number: '12',
                                color: Color(0xffC4E4FF),
                                image: 'assets/images/videos.svg',
                              ),
                              ResourcesWidget(
                                onTap: null,
                                type: 'Audios',
                                number: '12',
                                color: Color(0xff7DDE86),
                                image: 'assets/images/audios.svg',
                              ),
                            ],
                          )
                        ],
                      )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

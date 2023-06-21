import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/course_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class CourseView extends StatelessView<Course, CourseController> {
  const CourseView(CourseController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
            backgroundColor: const Color(0xff25435B),
            centerTitle: true,
            title: const Text(
              'Enrolled Courses',
            )),
        body: _body(context));
  }

   Widget _body(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.all(10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 20.h,
          ),
          const EnrolledCourseWidget(onTap: null),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              const Expanded(
                child: CardWidget(
                  title: 'Enrolled Course',
                  number: '12',
                  onTap: null,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Expanded(
                child: CardWidget(
                  title: 'Resources',
                  number: '18',
                  onTap: null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                child: CardWidget(
                  title: 'Assignment',
                  number: '4',
                  onTap: null,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 80.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                const RecentClassWidget(
                  title: 'Introduction to Arabic Language I',
                  code: 'ARB 111',
                  onTap: null,
                ),
                SizedBox(
                  width: 15.w,
                ),
                const RecentClassWidget(
                  title: 'Introduction to Chemistry',
                  code: 'CHM 141',
                  onTap: null,
                ),
                SizedBox(
                  width: 15.w,
                ),
                const RecentClassWidget(
                  title: 'General Studies',
                  code: 'GNS 101',
                  onTap: null,
                ),
                SizedBox(
                  width: 15.w,
                ),
                const RecentClassWidget(
                  title: 'MAthematics',
                  code: 'MTH 111',
                  onTap: null,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
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
          ),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/pdf.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const CourseInfoWidget(
            onTap: null,
          ),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/audio_doc.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/pdf.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/audio_doc.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/pdf.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/audio_doc.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/pdf.svg', onTap: null),
        ]),
      ),
    );
  }

  moreActions(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                // border: Border.all(color: Color(0xffD1D5DB)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                color: const Color(0xff25435B)),
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 18.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    // border: Border.all(color: Color(0xffD1D5DB)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r)),
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        SvgPicture.asset('assets/images/rectangle.svg'),
                        SizedBox(
                          height: 26.h,
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: REdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const Divider(
                                    color: Colors.red,
                                  ),
                                  Text(
                                    'Course',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff202325)),
                                  ),
                                  const Divider(
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/reg.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  SvgPicture.asset('assets/images/add.svg',
                                      fit: BoxFit.scaleDown),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  SvgPicture.asset('assets/images/res.svg',
                                      fit: BoxFit.scaleDown)
                                ],
                              ),
                              SizedBox(
                                height: 35.h,
                              ),
                              Row(
                                children: [
                                  const Divider(
                                    color: Colors.red,
                                  ),
                                  Text(
                                    'Assessment',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff202325)),
                                  ),
                                  const Divider(
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/exa.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  SvgPicture.asset('assets/images/test.svg',
                                      fit: BoxFit.scaleDown),
                                ],
                              ),
                              SizedBox(
                                height: 35.h,
                              ),
                              Row(
                                children: [
                                  const Divider(
                                    height: 10,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Extension',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff202325)),
                                  ),
                                  const Divider(
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/ass_ext.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  SvgPicture.asset('assets/images/test_ext.svg',
                                      fit: BoxFit.scaleDown),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  SvgPicture.asset('assets/images/rep_ext.svg',
                                      fit: BoxFit.scaleDown),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  SvgPicture.asset(
                                      'assets/images/test_rest.svg',
                                      fit: BoxFit.scaleDown)
                                ],
                              ),
                              SizedBox(
                                height: 35.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

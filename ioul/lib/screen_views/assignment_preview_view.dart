import 'package:flutter/material.dart';
import '../components/components.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/assignment_preview_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class AssignmentPreviewView
    extends StatelessView<AssignmentPreview, AssignmentPreviewController> {
  const AssignmentPreviewView(AssignmentPreviewController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper().appBackArrowWithTitleAndTabBar(context,
            title: '2023 Spring Semester Assignment',
            bottomWidget: const SizedBox()),
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TaskStatusWidget(onTap: () {}),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: REdgeInsets.symmetric(horizontal: 15, vertical: 19),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: const Color(0xffffffff),
                  boxShadow: const [
                    BoxShadow(color: Color(0xffffffff), blurRadius: 3)
                  ]),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Downloads',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        '1. Report Template',

                        style: TextStyle(
                            fontSize: 14.sp,
                            // decoration: TextDecoration
                            //     .underline,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        '2. Report Form',
                        style: TextStyle(
                            fontSize: 14.sp,
                            // decoration: TextDecoration
                            //     .underline,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        '3. Report Letter',
                        style: TextStyle(
                            fontSize: 14.sp,
                            // decoration: TextDecoration
                            //     .underline,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              padding: REdgeInsets.symmetric(horizontal: 15, vertical: 19),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: const Color(0xffffffff),
                  boxShadow: const [
                    BoxShadow(color: Color(0xffffffff), blurRadius: 3)
                  ]),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'File Uploads',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                                color: const Color(0xff000000)),
                          ),
                          SizedBox(width: 10.w),
                          SvgPicture.asset("assets/images/red_star.svg"),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Document',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                color: const Color(0xff000000)),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Upload Assignment',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: const Color(0xff000000)),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          InkWell(
                            onTap: (){},
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.sp),
                                  border: Border.all(color: Colors.black),
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: REdgeInsets.symmetric(vertical: 10.0,horizontal: 120),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/images/upload.svg',fit: BoxFit.scaleDown,),
                                        SizedBox(width: 5.w,),
                                        Text(
                                          'Choose File',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily:'Inter',
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h,),
                          const Divider(color: Colors.black,)
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Image',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                color: const Color(0xff000000)),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Upload Assignment',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: const Color(0xff000000)),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          InkWell(
                            onTap: (){},
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.sp),
                                  border: Border.all(color: Colors.black),
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: REdgeInsets.symmetric(vertical: 10.0,horizontal: 120),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/images/upload.svg',fit: BoxFit.scaleDown,),
                                        SizedBox(width: 5.w,),
                                        Text(
                                          'Choose File',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily:'Inter',
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h,),
                          const Divider(color: Colors.black,)
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Video',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                color: const Color(0xff000000)),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Upload Assignment',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: const Color(0xff000000)),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          InkWell(
                            onTap: (){},
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.sp),
                                  border: Border.all(color: Colors.black),
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: REdgeInsets.symmetric(vertical: 10.0,horizontal: 120),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/images/upload.svg',fit: BoxFit.scaleDown,),
                                        SizedBox(width: 5.w,),
                                        Text(
                                          'Choose File',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily:'Inter',
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h,),
                          const Divider(color: Colors.black,)
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Audio',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                color: const Color(0xff000000)),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Upload Assignment',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: const Color(0xff000000)),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          InkWell(
                            onTap: (){},
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.sp),
                                  border: Border.all(color: Colors.black),
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: REdgeInsets.symmetric(vertical: 10.0,horizontal: 120),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/images/upload.svg',fit: BoxFit.scaleDown,),
                                        SizedBox(width: 5.w,),
                                        Text(
                                          'Choose File',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily:'Inter',
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h,),
                          const Divider(color: Colors.black,)
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h,),
            SubmitButtonWidget(label: 'Submit Assignment', onPressed: (){})
          ],
        ),
      ),
    );
  }
}

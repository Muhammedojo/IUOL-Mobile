import '../components/components.dart';
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
    return Container(
      height: 50.h,
      color: const Color(0xff25435B),
      child: SafeArea(
        right: false,
        left: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.backgroundWhite,
            // appBar: WidgetHelper().appBackArrowWithTitleAndTabBar(context,
            //     title: '2023 Spring Semester Assignment',
            //     bottomWidget: const SizedBox()),
            body: WidgetWrapper(child: _body())),
      ),
    );
  }
  Widget _body() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: const Color(0xff25435B),
              height: 120.h,
              alignment: Alignment.centerLeft,
              padding: REdgeInsets.only(left: 24),
              width: double.infinity,
              child: Column(
                children: [
                  Row(children: [
                    GestureDetector(
                      onTap: () => state.onBackPressed(),
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        constraints: BoxConstraints(maxHeight: 36.h, maxWidth: 36.w),
                        margin: REdgeInsets.only(top: 8),
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
                  ],),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2023 Spring Semester Assignment',style: TextStyle(fontSize: 18.sp,fontFamily: 'Inter',
                          fontWeight: FontWeight.w700),),

                    ],
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
              child: Column(children: [
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assignment Questions',
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
                        'Write an essay on the use of computer for secondary school learners',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Divider(color: Color(0xff0f0f0f),),
                      Text(
                        'Assignment Description',
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
                        'Your essay as to be written in a template and reference should be included',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Divider(color: Color(0xff0f0f0f),),
                      Text(
                        'Assignment Rubrics',
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
                        'Content 40%',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        'Content 40%',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        'Reference 25%',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        'Summary 10%',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        'Spelling and Grammar 20%',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        'Conformity with Project 15%',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Divider(color: Color(0xff0f0f0f),),
                      SizedBox(
                        height: 16.h,
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.sp),
                            color:const Color(0xffC4E4FF)
                          ),
                          child: Center(
                            child: Padding(
                              padding: REdgeInsets.symmetric(vertical: 16.0,horizontal: 90),
                              child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/images/download.svg',height: 24.w,width: 24.w,fit: BoxFit.scaleDown,),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      'Assignment Template',
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
                      )
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              Text('Please note that you have to use the above template', style: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: 'Inter',
                                  color:
                                  const Color(0xff0f0f0f),
                                  fontWeight:
                                  FontWeight.w400),),
                              const Divider(
                                color: Color(0xff0f0f0f),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h,),
                SubmitButtonWidget(label: 'Submit Assignment', onPressed: (){}),
                SizedBox(height: 16.h,),
              ],),
            ),
          ),
        ),

      ],
    );
  }
}

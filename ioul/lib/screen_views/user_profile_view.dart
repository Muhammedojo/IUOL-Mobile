import 'package:flutter/material.dart';
import 'package:ioul/packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/user_profile_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class UserProfileView
    extends StatelessView<UserProfile, UserProfileController> {
  const UserProfileView(UserProfileController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () => state.onBackPressed(),
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        constraints: BoxConstraints(maxHeight: 36.h, maxWidth: 36.w),
                        margin: REdgeInsets.only(top: 8),
                        decoration: const BoxDecoration(
                          color: Color(0xff25435B),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],),
                ),
                SizedBox(height: 15.h,),
                Padding(
                  padding:REdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              'https://www.essence.com/wp-content/uploads/2020/12/GettyImages-957598612-scaled.jpg',
                              fit: BoxFit.cover,
                              height: 64.w,
                              width: 64.w,
                              errorBuilder: (BuildContext context, Object exception,
                                  StackTrace? stackTrace) {
                                return Image.asset(
                                  'assets/images/iconic_logo.png',
                                  width: 64.w,
                                  height: 64.w,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Sulaimon Adili',
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff090A0A)),
                              ),
                              Text(
                                'sulaiman.idris@gmail.com',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff090A0A)),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 28.h,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.sp),
                            color: const Color(0xffE7F4FF
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: REdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View Profile',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily:'Inter',
                                          color: const Color(0xff4EAFFF),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h,),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Padding(
                    padding:REdgeInsets.symmetric(horizontal: 24.0,vertical: 15),
                    child: Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Row(
                        children: [
                          Text(
                            'Course',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: const Color(0xff404446)),
                          ),

                        ],
                      ),
                        SizedBox(height: 10.h,),
                        const Divider(),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),

                    ],),
                  ),
                ),
                SizedBox(height: 30.h,),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Padding(
                    padding:REdgeInsets.symmetric(horizontal: 24.0,vertical: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Extension',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Inter',
                                  color: const Color(0xff404446)),
                            ),

                          ],
                        ),
                        SizedBox(height: 10.h,),
                        const Divider(),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),

                      ],),
                  ),
                ),
                SizedBox(height: 30.h,),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Padding(
                    padding:REdgeInsets.symmetric(horizontal: 24.0,vertical: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Payment',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Inter',
                                  color: const Color(0xff404446)),
                            ),

                          ],
                        ),
                        SizedBox(height: 10.h,),
                        const Divider(),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding:REdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/card.svg'),
                              SizedBox(width: 12.w,),
                              Text(
                                'Course Registration',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    color: const Color(0xff404446)),
                              ),

                            ],
                          ),
                        ),

                      ],),
                  ),
                ),

              ],
            )));
  }
}

import 'package:ioul/packages/package.dart';
import '../bloc/bloc.dart';
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
    return Scaffold(body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Row(
                children: [
                  BlocBuilder<UserCubit, UserState>(
                      builder: (context, stateBloc) {
                    if (stateBloc is UserLoaded) {
                      return Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Image.network(
                            width: 38,
                            height: 38,
                            '${stateBloc.login.user?.imageUrl}',
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Text(
                                state.extractLetters(
                                    '${stateBloc.login.fullName()}'),
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Styles.font,
                                    color: const Color(0xffffffff)),
                              );
                            },
                          ),
                        ),
                      );
                    }
                    return Text(
                      '',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: Styles.font,
                          color: const Color(0xffffffff)),
                    );
                  }),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocBuilder<UserCubit, UserState>(
                          builder: (context, stateBloc) {
                        if (stateBloc is UserLoaded) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${stateBloc.login.fullName()}',
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Styles.font,
                                    color: Colors.blue),
                              ),
                              Text(
                                '${stateBloc.login.user?.email}',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Styles.font,
                                    color: Colors.blue),
                              )
                            ],
                          );
                        }
                        return Text(
                          '',
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: Styles.font,
                              color: const Color(0xffffffff)),
                        );
                      }),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 28.h,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45.sp),
                    color: const Color(0xffE7F4FF),
                  ),
                  child: Center(
                    child: Padding(
                      padding: REdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'edit_profile'.tr(),
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: Styles.font,
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
        SizedBox(
          height: 16.h,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'course'.tr(),
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: Styles.font,
                          color: const Color(0xff404446)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Divider(),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/card.svg'),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Course Registration',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Styles.font,
                            color: const Color(0xff404446)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/card.svg'),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Course Registration',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Styles.font,
                            color: const Color(0xff404446)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
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
                          fontFamily: Styles.font,
                          color: const Color(0xff404446)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Divider(),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/card.svg'),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Exam Registration',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Styles.font,
                            color: const Color(0xff404446)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/card.svg'),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Exam Registration',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Styles.font,
                            color: const Color(0xff404446)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
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
                          fontFamily: Styles.font,
                          color: const Color(0xff404446)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Divider(),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/card.svg'),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Tuition Payment',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Styles.font,
                            color: const Color(0xff404446)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/card.svg'),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Semester Reg Payment',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Styles.font,
                            color: const Color(0xff404446)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/card.svg'),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Course Reg Payment',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Styles.font,
                            color: const Color(0xff404446)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    )));
  }
}

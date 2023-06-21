import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/home_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class HomeView extends StatelessView<Home, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      floatingActionButton: InkWell(
        radius: 100.r,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          width: 68.w,
          height: 68.h,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 2.r,
                  spreadRadius: 1.r)
            ],
          ),
          child: SvgPicture.asset(
            "assets/images/course.svg",
            fit: BoxFit.none,
            width: 32.w,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        height: 80.h,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 34.w,
              padding: REdgeInsets.only(left: 25, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => state.setCurrentIndex(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Opacity(
                          opacity:
                              state.widget.navigationShell.currentIndex != 0
                                  ? 0.7
                                  : 1,
                          child: SvgPicture.asset(
                            // state.widget.navigationShell.currentIndex == 0
                            //     ? "assets/svgs/home_active.svg"
                            "assets/images/course.svg",
                            fit: BoxFit.cover,
                            width: 20.w,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Course",
                          style: TextStyle(
                              fontSize: 8.sp, color: AppColors.primaryBlue),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => state.setCurrentIndex(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Opacity(
                          opacity:
                              state.widget.navigationShell.currentIndex != 1
                                  ? 0.7
                                  : 1,
                          child: SvgPicture.asset(
                            // state.widget.navigationShell.currentIndex == 1
                            //     ? "assets/svgs/winner_active.svg"
                            "assets/images/assignment.svg",
                            fit: BoxFit.cover,
                            width: 20.w,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Assignment",
                          style: TextStyle(
                              fontSize: 8.sp, color: AppColors.primaryBlue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 34.w,
              padding: REdgeInsets.only(right: 25, left: 35),
              // color: Colors.amber,
              // height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () => state.setCurrentIndex(2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Opacity(
                          opacity:
                              state.widget.navigationShell.currentIndex != 2
                                  ? 0.7
                                  : 1,
                          child: SvgPicture.asset(
                            // state.widget.navigationShell.currentIndex == 2
                            //     ? "assets/svgs/wallet_active.svg"
                            "assets/images/report.svg",
                            fit: BoxFit.cover,
                            width: 20.w,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Report",
                          style: TextStyle(
                              fontSize: 8.sp, color: AppColors.primaryBlue),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => state.setCurrentIndex(3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Opacity(
                          opacity:
                              state.widget.navigationShell.currentIndex != 3
                                  ? 0.7
                                  : 1,
                          child: SvgPicture.asset(
                            // state.widget.navigationShell.currentIndex == 3
                            //     ? "assets/svgs/profile_active.svg"
                            "assets/images/more_active.svg",
                            fit: BoxFit.cover,
                            width: 20.w,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "More",
                          style: TextStyle(
                              fontSize: 8.sp, color: AppColors.primaryBlue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: state.widget.navigationShell,
    );
  }
}

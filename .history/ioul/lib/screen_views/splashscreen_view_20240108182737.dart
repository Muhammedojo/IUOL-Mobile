import 'package:ioul/components/text_widget.dart';
import 'package:ioul/packages/package.dart';
import 'package:ioul/values/values.dart';
import '../screens/screens.dart';
import 'stateless_view.dart';

class SplashScreenView
    extends StatelessView<SplashScreen, SplashScreenController> {
  const SplashScreenView(SplashScreenController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.h,
            child: Container(
              height: 505.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.lightGrey.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28.r),
                  bottomRight: Radius.circular(28.r),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.h,
            child: Container(
              height: 490.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // color: Colors.amber,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(48.r),
                  bottomRight: Radius.circular(48.r),
                ),
              ),
              child: FadeTransition(
                opacity: state.animationController,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(48.r),
                    bottomRight: Radius.circular(48.r),
                  ),
                  child: Image.asset(
                    "assets/images/onboard${state.currentIndex}.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 431.h,
            child: Container(
              height: 59.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(48.r),
                  bottomRight: Radius.circular(48.r),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: state.currentIndex == 1 ? 28 : 9.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: state.currentIndex == 1
                          ? AppColors.backgroundWhite
                          : AppColors.secondaryLightBlue,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: state.currentIndex == 2 ? 28 : 9.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: state.currentIndex == 2
                          ? AppColors.backgroundWhite
                          : AppColors.secondaryLightBlue,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: state.currentIndex == 3 ? 28 : 9.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: state.currentIndex == 3
                          ? AppColors.backgroundWhite
                          : AppColors.secondaryLightBlue,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 540.h,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 37),
                    child: TextWidget(
                      text: "Learn Online From Your Home",
                      style: Styles.x32dp_25435B_700w(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 17.h),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 37),
                    child: TextWidget(
                      text:
                          "Amet minim mollit non deserunt ullamco est sit aliqua amet sint. Velit officia consequat duis enim velit mollit.",
                      style: Styles.x15dp_303437_400w(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 84.h),
                  ElevatedButton(
                    onPressed: () => state.changeOnboardView(),
                    style: ElevatedButton.styleFrom(
                      padding: REdgeInsets.only(
                          left: 38, right: 20, top: 20, bottom: 20),
                      // fixedSize: Size(251.w, 83.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(83.r),
                      ),
                      elevation: 24,
                      shadowColor: AppColors.primaryBlue,
                      backgroundColor: AppColors.primary,
                    ),
                    child: SizedBox(
                      width: 140.w,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget(
                            text: "Next",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.backgroundWhite,
                            ),
                          ),
                          // SizedBox(width: 63.w),
                          const Spacer(),
                          Container(
                            width: 71.w,
                            height: 43.h,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundWhite,
                              borderRadius: BorderRadius.circular(43.r),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.primary,
                              size: 14.w.h,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 418.h,
            left: 88.w,
            child: SvgPicture.asset("assets/images/back_circle.svg"),
          ),
          Positioned(
            bottom: 388.h,
            right: 74.w,
            child: SvgPicture.asset("assets/images/back_circle.svg"),
          ),
          Positioned(
            bottom: 306.h,
            right: 142.w,
            child: SvgPicture.asset("assets/images/back_circle.svg"),
          ),
          Positioned(
            bottom: 249.h,
            right: 26.w,
            child: SvgPicture.asset("assets/images/back_circle.svg"),
          ),
          Positioned(
            bottom: 165.h,
            left: 31.w,
            child: SvgPicture.asset("assets/images/back_circle.svg"),
          ),
          Positioned(
            left: 173.h,
            bottom: 26.w,
            child: SvgPicture.asset("assets/images/back_circle.svg"),
          ),
        ],
      ),
    );
  }
}

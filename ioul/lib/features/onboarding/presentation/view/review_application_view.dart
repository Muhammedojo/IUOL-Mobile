import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../../auth/presentation/controller/controller.dart';
import '../controller/controller.dart';

class ReviewApplicationView
    extends StatelessView<ReviewApplication, ReviewApplicationController> {
  const ReviewApplicationView(ReviewApplicationController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/images/check.svg',
                    height: 132.w,
                    width: 132.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Congratulations!',
                  style: Styles.x16dp_202325_400w(),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Your application has been submitted successfully, we will  evaluate your documents and notify you by email.',
                    style: Styles.x16dp_202325_400w(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 37.sp,
            left: 0,
            right: 0,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButtonWidget(
                  title: "Login Page",
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      )),
            ),
          )
        ],
      ),
    );
  }
}

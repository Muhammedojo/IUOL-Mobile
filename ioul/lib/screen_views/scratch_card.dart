import 'package:ioul/helpers/helper.dart';
import 'package:ioul/packages/package.dart';
import 'package:ioul/router/route_constants.dart';
import '../components/components.dart';
import '../screens_controllers/scratch_card.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class ScratchCardView
    extends StatelessView<ScratchCard, ScratchCardController> {
  const ScratchCardView(ScratchCardController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundWhite,
      appBar: WidgetHelper().appBackArrowOnly(context),
      body: WidgetWrapper(
        child: SingleChildScrollView(
          child: SizedBox(
            // padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 60.h),
                  Image.asset(
                    "assets/images/iconic_logo.png",
                    // fit: BoxFit.contain,
                    height: 120.h,
                    width: 174.w,
                  ),
                  SizedBox(height: 36.h),
                  TextWidget(
                    text: "Admission Process Payment",
                    style: Styles.x16dp_000000_400w(),
                  ),
                  SizedBox(height: 72.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: "Enter Scratch Card",
                        style: Styles.x16dp_202325_400w(),
                      ),
                      SizedBox(width: 10.w),
                      SvgPicture.asset("assets/images/red_star.svg"),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  TextFieldWidget(
                    title: "000000000000",
                    controller: state.scratchCardController,
                  ),
                  SizedBox(height: 51.h),
                  ElevatedButtonWidget(
                    title: "Proceed",
                    onTap: () => NavigatorHelper(context).pushNamedScreen(
                      RouteConstants.applicationConfirmation,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

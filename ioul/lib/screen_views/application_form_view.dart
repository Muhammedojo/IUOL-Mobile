import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/helpers/widget_helper.dart';
import 'package:ioul/screens_controllers/programme_controller.dart';
import 'package:ioul/screens_controllers/sponsor_controller.dart';
import 'package:ioul/screens_controllers/upload_controller.dart';
import '../components/components.dart';
import '../values/values.dart';
import '../helpers/helper.dart';
import '../screens/screens.dart';
import 'stateless_view.dart';

class ApplicationFormView
    extends StatelessView<ApplicationForm, ApplicationFormController> {
  const ApplicationFormView(ApplicationFormController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundWhite,
      appBar: WidgetHelper().appBackArrowWithTitleAndTabBar(
        context,
        title: "Application form",
        bottomWidget: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 0,
                      end: state.initialProgress,
                    ),
                    duration: const Duration(milliseconds: 600),
                    builder: (context, value, _) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: LinearProgressIndicator(
                          value: value,
                          minHeight: 4.h,
                          valueColor:
                              const AlwaysStoppedAnimation(AppColors.primary),
                          backgroundColor: AppColors.skyLightest,
                        ),
                      );
                    }),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: IgnorePointer(
                  child: TabBar(
                    // tabAlignment: TabAlignment.start,
                    physics: const AlwaysScrollableScrollPhysics(),
                    isScrollable: true,
                    controller: state.tabController,
                    dragStartBehavior: DragStartBehavior.start,
                    indicatorSize: TabBarIndicatorSize.label,
                    // padding: REdgeInsets.only(right: 24, left: 24),
                    padding: EdgeInsets.zero,
                    enableFeedback: true,
                    labelPadding: EdgeInsets.zero,
                    unselectedLabelColor: AppColors.inkDarker.withOpacity(0.6),
                    unselectedLabelStyle: Styles.x16dp_72777A_400w(),
                    labelStyle: Styles.x16dp_25435B_400w(),
                    labelColor: AppColors.inkDarker,
                    indicatorPadding: REdgeInsets.only(right: 16),
                    indicatorColor: AppColors.primary,
                    tabs: [
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: const Text("Personal"),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: const Text("Address"),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: const Text("Contacts"),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: const Text("Sponsor"),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: const Text("Programme"),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: const Text("Certificates"),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: const Text("Uploads"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _body(context),
    );
  }

  WidgetWrapper _body(BuildContext context) {
    return WidgetWrapper(
      child: SizedBox(
        // padding: MediaQuery.of(context).viewInsets,
        height: MediaQuery.of(context).size.height - 170.h,
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 14.h),
              Flexible(
                flex: 1,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: state.tabController,
                  children: [
                    Personal(
                      selectedIndex: state.selectedIndex,
                      controller: state.tabController,
                      initialProgress: () => state.setInitialProgress(2),
                    ),
                    Address(
                      selectedIndex: state.selectedIndex,
                      controller: state.tabController,
                      initialProgress: () => state.setInitialProgress(3),
                      decreaseProgress: () => state.setInitialProgress(1),
                    ),
                    Contact(
                      selectedIndex: state.selectedIndex,
                      controller: state.tabController,
                      initialProgress: () => state.setInitialProgress(4),
                      decreaseProgress: () => state.setInitialProgress(2),
                    ),
                    Sponsor(
                      selectedIndex: state.selectedIndex,
                      controller: state.tabController,
                      initialProgress: () => state.setInitialProgress(5),
                      decreaseProgress: () => state.setInitialProgress(3),
                    ),
                    Programme(
                      selectedIndex: state.selectedIndex,
                      controller: state.tabController,
                      initialProgress: () => state.setInitialProgress(6),
                      decreaseProgress: () => state.setInitialProgress(4),
                    ),
                    Certificate(
                      selectedIndex: state.selectedIndex,
                      controller: state.tabController,
                      initialProgress: () => state.setInitialProgress(7),
                      decreaseProgress: () => state.setInitialProgress(5),
                    ),
                    const Upload(),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

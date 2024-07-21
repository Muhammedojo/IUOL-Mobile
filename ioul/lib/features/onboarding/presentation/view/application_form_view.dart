import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../controller/controller.dart';

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
        title: "application_form".tr(),
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
                        child: Text(
                          "personal".tr(),
                          style: Styles.x12dp_4EAFFF_400w(),
                        ),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: Text(
                          "address".tr(),
                          style: Styles.x12dp_4EAFFF_400w(),
                        ),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: Text(
                          "contacts".tr(),
                          style: Styles.x12dp_4EAFFF_400w(),
                        ),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: Text(
                          "sponsor".tr(),
                          style: Styles.x12dp_4EAFFF_400w(),
                        ),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: Text(
                          "programme".tr(),
                          style: Styles.x12dp_4EAFFF_400w(),
                        ),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: Text(
                          "certificates".tr(),
                          style: Styles.x12dp_4EAFFF_400w(),
                        ),
                      ),
                      Container(
                        padding:
                            REdgeInsets.only(right: 16, top: 16, bottom: 16),
                        child: Text(
                          "uploads".tr(),
                          style: Styles.x12dp_4EAFFF_400w(),
                        ),
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
                    Upload(
                      decreaseProgress: () => state.setInitialProgress(6),
                    ),
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

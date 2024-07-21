import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../bloc/bloc.dart';
import '../controller/controller.dart';

class CourseRegistrationPreviewView extends StatelessView<
    CourseRegistrationPreview, CourseRegistrationPreviewController> {
  const CourseRegistrationPreviewView(CourseRegistrationPreviewController state,
      {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
          // backgroundColor: const Color(0xff25435B),
          leading: GestureDetector(
            onTap: () => state.onBackPressed(),
            child: Container(
              width: 30.w,
              height: 30.h,
              constraints: BoxConstraints(maxHeight: 30.h, maxWidth: 30.w),
              margin: REdgeInsets.only(top: 8, left: 12),
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
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0.h), child: const SizedBox()),
          title:
              Text('selected_courses'.tr(), style: Styles.x18dp_202326_700w()),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xff25435B), Color(0xff2799F7)]),
            ),
          ),
        ),
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
          child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: 6.h,
                          ),
                      itemCount: widget.selectedObjects.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PreviewCourseRegWidget(
                          course: widget.selectedObjects[index],
                        );
                      }),
                  SizedBox(
                    height: 30.h,
                  ),
                  BlocListener<CourseRegCubit, CourseRegState>(
                      listener: (context, regState) {
                        if (regState is CourseRegLoading) {
                          WidgetHelper.showProgress(text: "processing".tr());
                        }
                        if (regState is CourseRegLoaded) {
                          WidgetHelper.hideProgress();
                          WidgetHelper.showSuccessToast(
                              context, '${regState.courseRegData.message}');
                          context.goNamed(RouteConstants.courses);
                        }
                        if (regState is CourseRegFailure) {
                          WidgetHelper.hideProgress();
                          WidgetHelper.showSuccessToast(
                              context, regState.message);
                        }
                      },
                      child: SubmitButtonWidget(
                        label: 'register'.tr(),
                        onPressed: () => state.sendRegisteredCourseToServer(),
                      ))
                ],
              )),
        ),
      ),
    ]);
  }
}

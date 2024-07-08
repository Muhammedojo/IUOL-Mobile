import '../../../../core/core.dart';
import '../../../../components/components.dart';
import '../../../../screens/screens.dart';
import '../controller/examination_extension_controller.dart';
import '../../../../screen_views/stateless_view.dart';

class ExaminationExtensionView extends StatelessView<ExaminationExtension,
    ExaminationExtensionController> {
  const ExaminationExtensionView(ExaminationExtensionController state,
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
          title: Text('examination_extension'.tr(),
              style: Styles.x18dp_202326_700w()),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xff25435B), Color(0xff2799F7)]),
            ),
          ),
        ),
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'These are the list of courses you failed to attampt their examinations during the assigned duration. Select the ones you wish to extend and proceed to payment. After payment a new date would be assigned.',
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontFamily: Styles.font,
                fontWeight: FontWeight.w400,
                color: const Color(0xff090A0A),
                fontSize: 16.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            '#1000 per course',
            style: TextStyle(
                fontFamily: Styles.font,
                fontWeight: FontWeight.w700,
                color: const Color(0xff090A0A),
                fontSize: 16.sp),
          ),
          SizedBox(height: 25.h),
          ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
            ),
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) => const ExamExtensionWidget(
              course: '',
              unit: '',
            ),
          ),
          SizedBox(height: 30.h),
          ElevatedButtonWidget(onTap: () {}, title: 'proceed_to_payment'.tr())
        ],
      ),
    );
  }
}

import '../packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/examination_schedule_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class ExaminationScheduleView
    extends StatelessView<ExaminationSchedule, ExaminationScheduleController> {
  const ExaminationScheduleView(ExaminationScheduleController state, {Key? key})
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
          title: Text('examination'.tr(), style: Styles.x18dp_202326_700w()),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your examinations have been scheduled',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 23.sp,
                fontFamily: Styles.font,
                fontWeight: FontWeight.w700,
                color: const Color(0xff000000)),
          ),
          SizedBox(
            height: 20.h,
          ),
          const ExamScheduleWidget(
            course: 'GST 111 - Communication in English',
            time: '2nd June, 2023',
            date: '02:00pm',
          ),
          SizedBox(
            height: 15.h,
          ),
          const ExamScheduleWidget(
            course: 'CMP 111 - Introduction to Computer Science',
            time: '2nd June, 2023',
            date: '02:00pm',
          ),
          SizedBox(
            height: 15.h,
          ),
          const ExamScheduleWidget(
            course: 'GST 111 - Communication in English',
            time: '2nd June, 2023',
            date: '02:00pm',
          ),
          SizedBox(
            height: 15.h,
          ),
          const ExamScheduleWidget(
            course: 'CMP 111 - Introduction to Computer Science',
            time: '2nd June, 2023',
            date: '02:00pm',
          ),
          SizedBox(
            height: 60.h,
          ),
          ElevatedButtonWidget(
            title: 'download_exam_timetable'.tr(),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

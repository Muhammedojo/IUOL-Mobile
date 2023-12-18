import 'package:ioul/packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/examination_extension_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

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
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0.h), child: const SizedBox()),
          title: Text(
            'Examination Extension',
            style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700),
          ),
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
                fontFamily: 'Inter',
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
                fontFamily: 'Inter',
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
          ElevatedButtonWidget(onTap: () {}, title: 'Proceed to Payment')
        ],
      ),
    );
  }
}

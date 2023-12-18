import '../packages/package.dart';
import '../values/values.dart';

class ExamExtensionWidget extends StatefulWidget {
  final String course;
  final String unit;
  const ExamExtensionWidget(
      {Key? key, required this.course, required this.unit})
      : super(key: key);

  @override
  State<ExamExtensionWidget> createState() => _ExamExtensionWidgetState();
}

class _ExamExtensionWidgetState extends State<ExamExtensionWidget> {
  @override
  Widget build(BuildContext context) {
    bool checked = true;

    toggleCheck() {
      setState(() {
        checked = !checked;
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'GST 111 - Communication in English',
          style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: const Color(0xff090A0A),
              fontSize: 16.sp),
        ),
        Checkbox(
          activeColor: AppColors.blueBase,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          value: checked,
          onChanged: (e) => toggleCheck(),
        ),
      ],
    );
  }
}

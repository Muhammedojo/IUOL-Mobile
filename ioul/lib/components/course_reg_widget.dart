import '../packages/package.dart';
import '../values/values.dart';

class CourseRegWidget extends StatefulWidget {
  final String course;
  final String unit;
  const CourseRegWidget({Key? key, required this.course, required this.unit})
      : super(key: key);

  @override
  State<CourseRegWidget> createState() => _CourseRegWidgetState();
}

class _CourseRegWidgetState extends State<CourseRegWidget> {
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
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GST 111 - Communication in English',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff090A0A),
                  fontSize: 16.sp),
            ),
            Text(
              '2 Unit',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff72777A),
                  fontSize: 14.sp),
            ),
          ],
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

import 'package:ioul/model/model.dart';
import '../packages/package.dart';
import '../values/values.dart';

class CourseRegWidget extends StatefulWidget {
  final SummaryCourse courseSummary;
  const CourseRegWidget({Key? key, required this.courseSummary})
      : super(key: key);

  @override
  State<CourseRegWidget> createState() => _CourseRegWidgetState();
}

class _CourseRegWidgetState extends State<CourseRegWidget> {
  final List<int> _selectedCourses = [];
  @override
  Widget build(BuildContext context) {
    void toggleSelection(int id) {
      setState(() {
        if (_selectedCourses.contains(widget.courseSummary.id)) {
          _selectedCourses.remove(widget.courseSummary.id);
        } else {
          _selectedCourses.add(widget.courseSummary.id ?? 0);
        }
      });
      print('Selected: ${_selectedCourses.length}');
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${widget.courseSummary.code}-${widget.courseSummary.title}',
                  style: TextStyle(
                      fontFamily: Styles.font,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff090A0A),
                      fontSize: 14.sp),
                ),
              ],
            ),
            Text(
              '${widget.courseSummary.units} Unit',
              style: TextStyle(
                  fontFamily: Styles.font,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff72777A),
                  fontSize: 13.sp),
            ),
          ],
        ),
        Checkbox(
          activeColor: AppColors.blueBase,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          value: _selectedCourses.contains(widget.courseSummary.id),
          onChanged: (bool? value) {
            toggleSelection(widget.courseSummary.id ?? 0);
          },
        ),
      ],
    );
  }
}

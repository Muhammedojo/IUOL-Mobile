import '../core/core.dart';

// ignore: must_be_immutable
class CourseRegWidget extends StatefulWidget {
  final SummaryCourse courseSummary;
  bool status;
  final Function() selectBox;
  CourseRegWidget(
      {Key? key,
      required this.courseSummary,
      required this.status,
      required this.selectBox})
      : super(key: key);

  @override
  State<CourseRegWidget> createState() => _CourseRegWidgetState();
}

class _CourseRegWidgetState extends State<CourseRegWidget> {
  @override
  Widget build(BuildContext context) {
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
          value: widget.status,
          onChanged: (bool? value) {
            widget.selectBox();
          },
        ),
      ],
    );
  }
}

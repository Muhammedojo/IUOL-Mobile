import '../packages/package.dart';
import '../values/values.dart';

class TestResetWidget extends StatefulWidget {
  final String course;
  final String unit;
  const TestResetWidget({Key? key, required this.course, required this.unit})
      : super(key: key);

  @override
  State<TestResetWidget> createState() => _TestResetWidgetState();
}

class _TestResetWidgetState extends State<TestResetWidget> {
  @override
  Widget build(BuildContext context) {
    bool checked = true;

    toggleCheck() {
      setState(() {
        checked = !checked;
      });
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.course,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff090A0A))),
                SizedBox(
                  height: 8.h,
                ),
                Text(widget.unit,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff72777A)))
              ],
            ),
            const Spacer(),
            Checkbox(
              activeColor: AppColors.blueBase,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              value: checked,
              onChanged: (e) => toggleCheck(),
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
        ),

      ],
    );
  }
}

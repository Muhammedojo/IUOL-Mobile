import 'package:ioul/model/model.dart';

import '../packages/package.dart';
import '../values/values.dart';

class UpcomingTaskWidget extends StatelessWidget {
  final Function()? onTap;
  final UpcomingTask? task;
  const UpcomingTaskWidget({Key? key, required this.onTap, this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.1,
            ),
          ],
        ),
        child: Padding(
            padding: REdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text('${task?.courseCode} - ${task?.courseTitle}',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: Styles.font,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff090A0A))),
                  ],
                ),
                Row(
                  children: [
                    Text('Due on ${task?.dueDate}',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: Styles.font,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff72777A))),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

import '../packages/package.dart';
import '../values/values.dart';

class DeptWidget extends StatelessWidget {
  final String icon;
  final String label;
  final Color? color;
  final Function() onTap;

  const DeptWidget(
      {Key? key,
      required this.icon,
      required this.label,
      this.color,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                // blurRadius: 2.0,
                spreadRadius: 0.1,
                offset: Offset(0.1, 0.2), // shadow direction: bottom right
              ),
            ]),
        child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 40, vertical: 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  icon,
                  fit: BoxFit.scaleDown,
                  height: 60.w,
                  width: 60.w,
                ),
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    // maxLines: 1,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff090A0A)),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

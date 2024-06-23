import '../core/core.dart';

class DeptWidget extends StatelessWidget {
  final Color? color;
  final Function() onTap;
  final Collection? collection;

  const DeptWidget({Key? key, this.color, required this.onTap, this.collection})
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
                const Text(
                  'Hello',
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Image.asset(
                  'assets/images/briefcase 1.png',
                  fit: BoxFit.scaleDown,
                  height: 60.w,
                  width: 60.w,
                ),
                Expanded(
                  child: Text(
                    '${collection?.subjectArea}',
                    textAlign: TextAlign.center,
                    // maxLines: 1,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: Styles.font,
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

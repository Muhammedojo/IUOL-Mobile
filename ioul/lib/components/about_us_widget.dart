import '../core/core.dart';
import '../core/packages/package.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.backgroundWhite,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: Styles.font,
                      color: const Color(0xff191C1C)),
                ),
              ],
            ),
          )),
    );
  }
}

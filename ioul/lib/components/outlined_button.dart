import 'package:ioul/packages/package.dart';
import 'package:ioul/values/values.dart';


class OutlinedButtonWidget extends StatelessWidget {
  OutlinedButtonWidget({
    Key? key,
    required this.onTap,
    required this.title,
    this.imagePath,
  }) : super(key: key);

  final Function onTap;
  final String title;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onTap(),
      style: OutlinedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 42.h),
        side: BorderSide(width: 1.w, color: AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(width: 1.w, color: AppColors.primary),
        ),
        backgroundColor: AppColors.backgroundWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagePath == null
              ? const SizedBox()
              : SvgPicture.asset(
                  imagePath!,
                  // color: Colors.amber,
                ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: Styles.x16dp_25435B_500w(),
          ),
        ],
      ),
    );
  }
}

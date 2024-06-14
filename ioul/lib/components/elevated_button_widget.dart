import '../core/core.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.r),
        ),
        backgroundColor:
            title == "Back" ? AppColors.backgroundWhite : AppColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title == "back".tr()
              ? SvgPicture.asset(
                  'assets/images/back.svg',
                  color: AppColors.primary,
                )
              : const SizedBox.shrink(),
          title == "next".tr()
              ? SizedBox(
                  width: 0.w,
                )
              : SizedBox(
                  width: 5.w,
                ),
          Text(
            title,
            style: title == "back".tr()
                ? Styles.x16dp_25435B_500w()
                : Styles.x16dp_0FFFFFF_500w(),
          ),
          title == "back".tr()
              ? SizedBox(
                  width: 0.w,
                )
              : SizedBox(
                  width: 5.w,
                ),
          title == "next".tr()
              ? SvgPicture.asset('assets/images/forward_arrow.svg',
                  color: Colors.white)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

import 'package:ioul/core/core.dart';

class ImageWithTitle extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function() onTap;
  final TextStyle? titleStyle;

  const ImageWithTitle({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.titleStyle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 99.w,
        width: 90.w,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.lightBlue,
                ),
                child: Padding(
                  padding:
                      REdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                  child: imageUrl.toSvg(),
                )),
            SizedBox(
                height:
                    5.0.h), // Add some space between the image and the title
            SizedBox(
              width: 95.w,
              child: Text(
                title.tr(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: Styles.font,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                maxLines: 2, // You can adjust the number of lines as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}

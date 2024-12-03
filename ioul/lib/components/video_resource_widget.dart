import 'package:ioul/core/core.dart';

class VideoResourceWidget extends StatelessWidget {
  final Function()? onTap;

  final String? index;
  final String? title;
  final String? time;
  final String? image;

  const VideoResourceWidget(
      {super.key,
      required this.onTap,
      this.index,
      this.title,
      this.time,
      this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          '$index'.toText(fontWeight: FontWeight.w500, fontSize: 24.sp),
          33.horizontalSpace,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '$title'.toText(fontWeight: FontWeight.w500, fontSize: 14.sp),
                '$time'.toText(fontWeight: FontWeight.w400, fontSize: 12.sp),
              ],
            ),
          ),
          SvgPicture.asset(
            '$image' ?? 'assets/images/play.svg',
            width: 30.w,
            height: 30.h,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}

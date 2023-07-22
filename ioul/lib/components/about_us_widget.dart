import '../packages/package.dart';
import '../values/values.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.backgroundWhite,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(1.0, 1.0), // shadow direction: bottom right
            ),
          ],
        ),
        child: ExpansionTile(
          title: Padding(
            padding: REdgeInsets.only(top: 8.0, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff191C1C)),
                ),
                SizedBox(
                  height: 19.h,
                ),
                Text(
                  'We Build A Platform For Centralized Educational System',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff191C1C)),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Iconic University of Open Learning read more>>',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greylight),
                ),
              ],
            ),
          ),
          textColor: Colors.red,
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Text(
                '''The aim and objective of this course is computer literacy. Information Technology is the frontier hero of the new century,driven by ambition and full courage, replicating itself like a virus and sweping all before it, So in order not to be marginalized ''',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ));
  }
}

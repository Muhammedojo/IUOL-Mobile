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
          padding: REdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${collection?.title}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: Styles.font,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff090A0A)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${collection?.subjectArea}',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Styles.font,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff303437)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

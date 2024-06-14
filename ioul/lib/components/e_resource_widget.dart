import '../core/core.dart';

class EResourceWidget extends StatelessWidget {
  final Function()? onTap;
  final Journal? journal;

  const EResourceWidget({Key? key, required this.onTap, this.journal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(0.5, 0.5), // shadow direction: bottom right
            ),
          ],
        ),
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
                      '${journal?.journalName}',
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
                      '${journal?.journalName}',
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

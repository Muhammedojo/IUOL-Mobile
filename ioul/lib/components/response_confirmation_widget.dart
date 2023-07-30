import '../packages/package.dart';

class ResponseConfirmationWidget extends StatelessWidget {
  final String? message;
  final String? image;
  final String? title;
  final Function()? onTap;

  const ResponseConfirmationWidget({
    Key? key,
    this.message,
    this.image,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(
            top: 18.0.sp, left: 10.0.sp, right: 10.0.sp, bottom: 10.0.sp),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(13)),
        ),
        margin: EdgeInsets.only(top: 13.0.sp, right: 8.0.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Text(
                "$message",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff090A0A),
                    fontFamily: 'Inter',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            image != null && image!.isNotEmpty
                ? Center(
                    child: SvgPicture.asset(
                      "assets/images/camp.svg",
                      fit: BoxFit.fill,
                      height: 150.h,
                    ),
                  )
                : Center(
                    child: Image.asset(
                      'assets/images/hurray.png',
                      fit: BoxFit.scaleDown,
                      height: 150.w,
                      width: 150.w,
                    ),
                  ),
            SizedBox(
              height: 5.0.h,
            ),
            Center(
              child: Text(
                "$title",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            InkWell(
              onTap: () {
                onTap;
              },
              child: const Center(
                child: Text(
                  'Done',
                ),
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
          ],
        ),
      ),
    );
  }
}

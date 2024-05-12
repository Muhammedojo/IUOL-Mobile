import '../packages/package.dart';
import '../values/values.dart';

class ErrorItemWidget extends StatelessWidget {
  final String? message;
  final String? title;
  final Function()? onTap;
  final double? imageHeight;
  final String? buttonLabel;
  final bool? hideButton;
  final String? image;
  final double? marginTop;

  const ErrorItemWidget({
    Key? key,
    this.message = "",
    this.title = "",
    this.onTap,
    this.imageHeight = 100,
    this.buttonLabel = "Refresh",
    this.hideButton = true,
    this.image = "assets/images/error-dark.svg",
    this.marginTop = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          //height: height ?? null,
          alignment: Alignment.center,
          //padding: EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0, bottom: 10.0),
          margin: REdgeInsets.only(
              left: 5.0, right: 5.0, top: marginTop ?? 5.0, bottom: 20),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            //borderRadius: BorderRadius.all(Radius.circular(13)),
          ),
          //margin: EdgeInsets.only(top: 13.0, right: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 5.h,
              ),
              Center(
                  child: SvgPicture.asset(
                "assets/images/empty-dark.svg",
                fit: BoxFit.cover,
                // color: Colors.black,
                height: imageHeight,
              )),
              SizedBox(
                height: 20.0.h,
              ),
              Center(
                child: Text(
                  "$title",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.inkDarkest,
                    fontFamily: Styles.font,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0.h,
              ),
              Center(
                child: Text(
                  "$message",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.textLight,
                    fontFamily: Styles.font,
                  ),
                ),
              ),
              hideButton != null && hideButton!
                  ? const SizedBox()
                  : SizedBox(
                      height: 10.0.h,
                    ),
              hideButton != null && hideButton!
                  ? const SizedBox()
                  : Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBlue,
                            padding: REdgeInsets.symmetric(
                                horizontal: 30, vertical: 5.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              //side: BorderSide(color: Colors.red)
                            ),
                            textStyle: TextStyle(
                                fontFamily: Styles.font,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          onTap!();
                        },
                        child: Text(
                          buttonLabel ?? 'Try again',
                          style: Styles.x15dp_303437_400w(),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

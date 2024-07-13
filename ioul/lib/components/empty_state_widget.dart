import '../core/core.dart';

class ErrorItemWidget extends StatelessWidget {
  final String? message;
  final String? title;
  final Function()? onTap;
  final double? imageHeight;

  final bool? hideButton;
  final String? image;
  final double? marginTop;

  const ErrorItemWidget({
    Key? key,
    this.message = "",
    this.title = "",
    this.onTap,
    this.imageHeight = 100,
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
          padding: REdgeInsets.symmetric(horizontal: 10, vertical: 30),
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
                height: 30.h,
              ),
              Center(
                  child: SvgPicture.asset(
                "assets/images/error.svg",
                // "assets/images/empty-dark.svg",
                // "assets/images/no_data.svg",
                fit: BoxFit.cover,
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
                          'refresh'.tr(),
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

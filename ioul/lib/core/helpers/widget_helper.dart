import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../components/components.dart';
import '../packages/package.dart';
import '../values/values.dart';
import 'helper.dart';

class WidgetHelper {
  AppBar appBackArrowOnly(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      leadingWidth: 45.w,
      leading: InkWell(
        onTap: () => NavigatorHelper(context).closeScreen(),
        child: Row(
          children: [
            SizedBox(width: 20.w),
            Icon(
              Icons.arrow_back_ios,
              size: 16.w.h,
              color: AppColors.inkDarkest,
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBackArrowWithTitle(BuildContext context,
      {required String title, required Function() onTap}) {
    return AppBar(
      leading: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 30.w,
          height: 30.h,
          constraints: BoxConstraints(maxHeight: 30.h, maxWidth: 30.w),
          margin: REdgeInsets.only(top: 8, left: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0.h), child: const SizedBox()),
      title: Text(title, style: Styles.x18dp_202326_700w()),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xff25435B), Color(0xff2799F7)]),
        ),
      ),
    );
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static showSuccessToast(BuildContext context, String message,
      {Function()? onTap}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => ResponseConfirmationWidget(
            title: "success".tr(),
            message: message,
            image: "",
            onTap: () => onTap));
  }

  bool isValidEmail(String email) {
    // Regular expression for a valid email address
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  static showToastError(BuildContext context, String message,
      {String? actionLabel, Function? onActionPressed}) {
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.primary,
      content: Text(
        message,
        style: Styles.x14dp_090A0A_400w(),
      ),
      action: onActionPressed != null
          ? SnackBarAction(
              label: actionLabel ?? "close".tr(),
              textColor:
                  AppColors.backgroundWhite, // or some operation you would like
              onPressed: () {
                onActionPressed();
                // on block runs when label is pressed
              },
            )
          : null,
    ));
  }

  static languageSelectionModal(
    context,
    Function(Locale) onSelectLanguage,
    List<Locale> locales,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10.h,
                ),
                const Icon(Icons.drag_handle_rounded),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      locales.length,
                      (index) => ListTile(
                            title: Text(
                              locales[index].toLanguageTag(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: Styles.font,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            //subtitle: Text(locales[index].languageCode),
                            subtitle: const Text(''),
                            leading: SvgPicture.asset(
                                'icons/flags/svg/${locales[index].countryCode!.toLowerCase()}.svg',
                                height: 20.w,
                                width: 20.w,
                                fit: BoxFit.contain,
                                package: 'country_icons'),
                            onTap: () {
                              Navigator.of(context).pop();
                              onSelectLanguage(locales[index]);
                            },
                          )),
                )
              ],
            ),
          );
        });
  }

  static showProgress({String? text}) {
    if (text != null && text.isNotEmpty) {
      return EasyLoading.show(
        status: text,
        maskType: EasyLoadingMaskType.black,

        // indicator: const CircularProgressIndicator(
        //   strokeWidth: 2.0,
        //   color: Colors.white,
        // )
      );
    }
    return EasyLoading.show(
        indicator: const CircularProgressIndicator(
      strokeWidth: 2.0,
      color: Colors.white,
    ));
  }

  static hideProgress() {
    return EasyLoading.dismiss();
  }

  AppBar appBackArrowWithTitleAndTabBar(BuildContext context,
      {required String title, required Widget bottomWidget}) {
    return AppBar(
      backgroundColor: Colors.white,

      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      leadingWidth: 45.w,
      title: TextWidget(
        text: title,
        style: Styles.x18dp_202325_500g(color: AppColors.inkDarkest),
      ),
      // centerTitle: false,
      leading: InkWell(
        onTap: () => NavigatorHelper(context).closeScreen(),
        child: Row(
          children: [
            SizedBox(width: 24.w),
            Icon(
              Icons.arrow_back_ios,
              size: 16.w.h,
              color: AppColors.inkDarkest,
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 65.h),
        child: bottomWidget,
      ),
    );
  }
}

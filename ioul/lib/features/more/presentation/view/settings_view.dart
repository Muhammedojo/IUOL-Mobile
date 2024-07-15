import 'package:flutter/cupertino.dart';
import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../../../screens/screens.dart';
import '../controller/settings_controller.dart';
import '../../../../core/utils/mvc.dart';

class SettingsView extends StatelessView<Settings, SettingsController> {
  const SettingsView(SettingsController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper().appBackArrowWithTitle(context,
            title: 'settings'.tr(), onTap: () => state.onBackPressed()),
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.backgroundWhite,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(1.0, 1.0), // shadow direction: bottom right
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      REdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'push_notifications'.tr(),
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: Styles.font,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff191C1C)),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'application'.tr(),
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: Styles.font,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff191C1C)),
                          ),
                          CupertinoSwitch(
                            value: state.onNotification,
                            onChanged: (value) {
                              state.onSwitch(value);
                            },
                            activeColor: AppColors.primaryBase,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text('receive_push_notification'.tr(),
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: Styles.font,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greylight))
                    ],
                  ),
                )),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () => state.showLanguageSelectionOption(),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.backgroundWhite,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(1.0, 1.0), // shadow direction: bottom right
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'switch_language'.tr(),
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: Styles.font,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff191C1C)),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Text('switch_to_another_language.'.tr(),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: Styles.font,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greylight)),
                          ],
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

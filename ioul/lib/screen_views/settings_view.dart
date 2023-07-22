import 'package:flutter/cupertino.dart';

import '../components/components.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/settings_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class SettingsView extends StatelessView<Settings, SettingsController> {
  const SettingsView(SettingsController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper().appBackArrowWithTitle(context, title: 'Settings'),
        body: WidgetWrapper(child:_body())
    );
  }
  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 24.h,),
          Container(
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
              child: Padding(
                padding:REdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,children: [
                  Text('Push Notifications', style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff191C1C)),),
                  SizedBox(height: 30.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('Application', style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff191C1C)),),
                    CupertinoSwitch(value: state.onNotification, onChanged: (value) {
                      state.onSwitch(value);
                    },activeColor:AppColors.primaryBase,)
                  ],),
                  SizedBox(height: 8.h,),
                  Text('Receive personalized notifications about your progress and activities ',style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greylight))
                ],),
              ))
        ],),
      ),
    );
  }
}

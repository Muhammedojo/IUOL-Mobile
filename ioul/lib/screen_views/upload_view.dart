import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/components/elevated_button_widget.dart';
import 'package:ioul/helpers/widget_helper.dart';
import 'package:ioul/values/styles.dart';
import '../components/components.dart';
import '../screens_controllers/application_form_controller.dart';
import '../screens_controllers/upload_view.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class UploadView extends StatelessView<Upload, UploadController> {
  const UploadView(UploadController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        // padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Text(
                  "Upload Screen",
                  style: Styles.x16dp_202325_400w(),
                ),
              ),
              SizedBox(height: 32.h),
              ElevatedButtonWidget(onTap: () {}, title: "Review Application")
            ],
          ),
        ),
      ),
    );
  }
}

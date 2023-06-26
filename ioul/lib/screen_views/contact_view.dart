import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/helpers/widget_helper.dart';
import 'package:ioul/values/styles.dart';
import '../components/components.dart';
import '../components/elevated_button_widget.dart';
import '../screens_controllers/application_form_controller.dart';
import '../screens_controllers/contact_view.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class ContactView extends StatelessView<Contact, ContactController> {
  const ContactView(ContactController state, {Key? key})
      : super(state, key: key);

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
                  "Contact Screen",
                  style: Styles.x16dp_202325_400w(),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButtonWidget(
                        onTap: () => state.onReversePressed(), title: "Back"),
                  ),
                  SizedBox(width: 132.w),
                  Expanded(
                    flex: 1,
                    child: ElevatedButtonWidget(
                        onTap: () => state.onNextPressed(), title: "Next"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

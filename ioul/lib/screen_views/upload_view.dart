import 'package:image_picker/image_picker.dart';
import 'package:ioul/bloc/submit_application/cubit.dart';
import 'package:ioul/components/outlined_button.dart';
import '../components/components.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../router/router.dart';
import '../screens_controllers/upload_controller.dart';
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
      child: Form(
        key: state.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Passport",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 14.h),
            state.passportImage != null
                ? Text(
                    '${state.passportImage?.path}',
                    style: Styles.x14dp_090A0A_500w(),
                  )
                : OutlinedButtonWidget(
                    onTap: () {
                      state.choosePassport(
                          ImageSource.gallery, state.passportImageController);
                    },
                    title: "Choose file",
                    imagePath: "assets/images/upload.svg",
                  ),
            SizedBox(height: 10.h),
            TextWidget(
              text:
                  "Please note that you can only upload JPEG files that do not exceed 2MiB. The photo will be cut to the ‘standard’ passport  size of 35 x 45 mm",
              style: Styles.x8dp_979C9E_400w(),
            ),
            SizedBox(height: 28.h),
            TextWidget(
              text:
                  "Please Upload the following documents/certificates as application requirement.Make sure you read the requirements for the programme chosen. Scan and upload certificates in one(1) PDF file.",
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(height: 18.h),
            Row(
              children: [
                TextWidget(
                  text: "1.",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 8.w),
                TextWidget(
                  text: "SSCE / O' Level / A' Level",
                  style: Styles.x16dp_202325_400w(),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                TextWidget(
                  text: "2.",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 8.w),
                TextWidget(
                  text: "Birth Certificate",
                  style: Styles.x16dp_202325_400w(),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                TextWidget(
                  text: "3.",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 8.w),
                TextWidget(
                  text: "Nationality/Identification Card",
                  style: Styles.x16dp_202325_400w(),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                TextWidget(
                  text: "4.",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 8.w),
                TextWidget(
                  text: "Primary Certificate",
                  style: Styles.x16dp_202325_400w(),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "5.",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextWidget(
                    text:
                        "Including any other certificates for special courses, direct entry and postgraduate candidates requirements",
                    style: Styles.x16dp_202325_400w(),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Document",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 14.h),
            state.documentImage != null
                ? Text(
                    '${state.documentImage?.uri}',
                    style: Styles.x14dp_090A0A_500w(),
                  )
                : OutlinedButtonWidget(
                    onTap: () {
                      state.chooseDocument(
                          ImageSource.gallery, state.pdfDocumentController);
                    },
                    title: "Choose file",
                    imagePath: "assets/images/upload.svg",
                  ),
            SizedBox(height: 12.h),
            TextWidget(
              text: "Please note that you can only upload .pdf file",
              style: Styles.x8dp_979C9E_400w(),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                // Checkbox(
                //     value: false,
                //     onChanged: (e) {
                //       state.visible;
                //     }),
                Checkbox(
                  activeColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  value: state.checked,
                  onChanged: (e) => state.toggleCheck(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: "I agree with the  ",
                      style: Styles.x12dp_090A0A_400w(),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "Terms and Conditions ",
                          style: Styles.x12dp_4EAFFF_400w(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.h),
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
                  child: BlocListener<SubmitApplicationCubit,
                      SubmitApplicationState>(
                    listener: (context, applicationState) {
                      if (applicationState is SubmitApplicationLoading) {
                        WidgetHelper.showProgress(text: 'Processing');
                      }
                      if (applicationState is SubmitApplicationLoaded) {
                        WidgetHelper.hideProgress();
                        context.goNamed(RouteConstants.reviewApplication);
                      }
                      if (applicationState is SubmitApplicationFailure) {
                        WidgetHelper.hideProgress();
                        WidgetHelper.showToastError(
                          context,
                          applicationState.message,
                        );
                      }
                    },
                    child: ElevatedButtonWidget(
                        onTap: () {
                          state.validateUploads();
                        },
                        title: "Review"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ioul/bloc/get_application_form/get_application_form_cubit.dart';
import 'package:ioul/model/model.dart';
import 'package:ioul/screen_views/stateless_view.dart';
import 'package:ioul/utils/extensions.dart';
import 'package:ioul/values/values.dart';

import '../components/widget_wrapper.dart';
import '../packages/package.dart';
import '../screens_controllers/admission_payment_invoice.dart';
import '../values/colors.dart';

class AdmissionPaymentInvoiceView extends StatelessView<AdmissionPaymentInvoice,
    AdmissionPaymentInvoiceController> {
  const AdmissionPaymentInvoiceView(AdmissionPaymentInvoiceController state,
      {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text("Payment Invoice"),
        ),
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(
            child:
                BlocConsumer<GetApplicationFormCubit, GetApplicationFormState>(
          listener: (context, applicationState) => switch (applicationState) {
            GetApplicationFormSuccess(data: final data) =>
              state.getApplicationDetail(data),
            _ => state.getApplicationDetail(ApplicationFormData()),
          },
          builder: (context, applicationState) {
            return switch (applicationState) {
              GetApplicationFormLoading _ => Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  color: AppColors.primary,
                )),
              GetApplicationFormError(error: String error) => Text(error),
              GetApplicationFormSuccess(data: ApplicationFormData data) =>
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 160.h),
                      Text(
                        "Iconic Open University",
                        style: Styles.x18dp_202325_500w(),
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: Styles.x16dp_000000_400w(),
                          ),
                          Text(
                            data.user?.name ?? "",
                            style: Styles.x16dp_25435B_500w(),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email",
                            style: Styles.x16dp_000000_400w(),
                          ),
                          Text(
                            data.user?.email ?? "",
                            style: Styles.x16dp_25435B_500w(),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone number",
                            style: Styles.x16dp_000000_400w(),
                          ),
                          Text(
                            data.user?.phone ?? "",
                            style: Styles.x16dp_25435B_500w(),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Amount",
                            style: Styles.x16dp_000000_400w(),
                          ),
                          Text(
                            "#${data.amount}",
                            style: Styles.x16dp_25435B_500w(),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment type",
                            style: Styles.x16dp_000000_400w(),
                          ),
                          Text(
                            data.paymentType?.capitalWords() ?? "",
                            style: Styles.x16dp_25435B_500w(),
                          ),
                        ],
                      ),
                      SizedBox(height: 120.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => state.onProceedToPayment(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          child: Text(
                            "Proceed to Payment",
                            style: Styles.x16dp_0FFFFFF_500w(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              _ => Text("Something went wrong"),
            };
          },
        )));
  }
}

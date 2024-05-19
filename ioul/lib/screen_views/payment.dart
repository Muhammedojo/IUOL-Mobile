// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:form_validator/form_validator.dart';
import 'package:uuid/uuid.dart';
import '../components/components.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../provider/endpoints.dart';
import '../values/values.dart';

class Payments extends StatefulWidget {
  const Payments(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();
  final publicKeyController = TextEditingController();
  final encryptionKeyController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCurrency = "";

  bool isTestMode = true;

  @override
  Widget build(BuildContext context) {
    currencyController.text = selectedCurrency;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: WidgetHelper().appBackArrowWithTitle(context,
          title: widget.title, onTap: () => onBackPressed()),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFieldWidget(
                  hint: "amount".tr(),
                  title: 'amount'.tr(),
                  controller: amountController,
                  textInputAction: TextInputAction.next,
                  onValidate: ValidationBuilder().required().build(),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: currencyController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: REdgeInsets.all(16),
                    fillColor: AppColors.backgroundWhite,
                    filled: true,
                    labelText: 'currency'.tr(),
                    hintText: 'currency'.tr(),
                    hintStyle: Styles.x12dp_72777A_400w(),
                    labelStyle: Styles.x12dp_72777A_400w(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.inkLight),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.inkLighter),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  readOnly: true,
                  onTap: _openBottomSheet,
                  validator: (value) => value != null && value.isNotEmpty
                      ? null
                      : "currency_is_required".tr(),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFieldWidget(
                  hint: "email".tr(),
                  title: 'email'.tr(),
                  controller: emailController,
                  onValidate: ValidationBuilder().required().build(),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFieldWidget(
                  hint: "phone_number".tr(),
                  title: "phone_number".tr(),
                  controller: phoneNumberController,
                  onValidate: ValidationBuilder().required().build(),
                ),
              ),
              SizedBox(height: 90.h),
              SubmitButtonWidget(
                label: 'proceed_to_payment'.tr(),
                onPressed: _onPressed,
                color: const Color(0xff25435B),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onPressed() {
    final currentState = formKey.currentState;
    if (currentState != null && currentState.validate()) {
      handlePaymentInitialization();
    }
  }

  onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  handlePaymentInitialization() async {
    final Customer customer = Customer(email: "customer@customer.com");

    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: publicKeyController.text.trim().isEmpty
            ? getPublicKey()
            : publicKeyController.text.trim(),
        currency: selectedCurrency,
        redirectUrl: 'https://facebook.com',
        txRef: const Uuid().v1(),
        amount: amountController.text.toString().trim(),
        customer: customer,
        paymentOptions: "card, payattitude, barter, bank transfer, ussd",
        customization: Customization(title: "Test Payment"),
        isTestMode: kDebugMode || !liveServer ? isTestMode : !isTestMode);

    final ChargeResponse response = await flutterwave.charge();
    showLoading(response.toString());
    // print("${response.toJson()}");
  }

  String getPublicKey() {
    return "FLWPUBK_TEST-632a46c05124f5170ec1c488bbe2bfb4-X";
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _getCurrency();
        });
  }

  Widget _getCurrency() {
    final currencies = [
      "NGN",
      "USD",
      "GBP",
      "KES",
    ];
    return Container(
      height: 250.h,
      margin: REdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: currencies
            .map((currency) => ListTile(
                  onTap: () => {_handleCurrencyTap(currency)},
                  title: Column(
                    children: [
                      Text(
                        currency,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black, fontFamily: Styles.font),
                      ),
                      SizedBox(height: 4.h),
                      const Divider(height: 1)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  _handleCurrencyTap(String currency) {
    setState(() {
      selectedCurrency = currency;
      currencyController.text = currency;
    });
    Navigator.pop(context);
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50.h,
            child: Text(message),
          ),
        );
      },
    );
  }
}

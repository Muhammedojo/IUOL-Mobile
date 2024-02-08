import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../model/model.dart';
import '../screen_views/address_view.dart';

class Address extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Address({
    Key? key,
    this.controller,
    this.initialProgress,
    this.selectedIndex,
    this.decreaseProgress,
  }) : super(key: key);

  final int? selectedIndex;
  final TabController? controller;
  final Function? initialProgress;
  final Function? decreaseProgress;

  @override
  AddressController createState() => AddressController();
}

class AddressController extends State<Address>
    with AutomaticKeepAliveClientMixin {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController lgaController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateOfResidenceController =
      TextEditingController();
  final TextEditingController permanentAddressController =
      TextEditingController();
  final TextEditingController workAddressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String selectedValue = "";

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  onNextPressed() {
    setState(() {
      widget.controller!.animateTo(2);
      widget.initialProgress!();
    });
  }

  onReversePressed() {
    setState(() {
      widget.controller!.animateTo(0);
      widget.decreaseProgress!();
    });
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AddressView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  validateAddressInfo() async {
    print('hello 1');
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final application = SubmitApplication();
      print('hello 9');
      application.lga = lgaController.text.trim();
      application.permanentAddress = permanentAddressController.text.trim();
      application.workAddress = workAddressController.text.trim();
      print('hello 8');
      application.nationalityId = nationalityController.text.trim() as int;

      application.stateId = stateController.text.trim() as int?;

      print('hello 4');
      application.residenceCountryId = countryController.text.trim() as int?;
      application.residenceStateId =
          stateOfResidenceController.text.trim() as int?;
      print('hello 5');

      print('hello 2');
      onNextPressed();
    } else {
      WidgetHelper.showToastError(context, "Fill required field.");
      return;
    }
  }

  @override
  bool get wantKeepAlive => true;
}

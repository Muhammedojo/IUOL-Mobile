import 'dart:developer';

import 'package:ioul/bloc/bloc.dart';
import 'package:ioul/packages/package.dart';
import 'package:ioul/response/country_response.dart';
import 'package:ioul/utils/utils.dart';

import '../helpers/helper.dart';
import 'package:flutter/material.dart';
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
    log("selected value: $value");
    setState(() {
      selectedValue = value;
    });
  }

  CountryData selectedCountry = CountryData();

  onSelectCountry(String value) {
    CountryState state = context.read<CountryCubit>().state;
    if (state is CountryLoaded) {
      selectedCountry = state.response.data!.firstWhere((element) =>
          element.name!.trim().toLowerCase() == value.trim().toLowerCase());
    }
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
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final application = GlobalVariables.applications.value;

      application.lga = lgaController.text.trim();
      application.permanentAddress = permanentAddressController.text.trim();
      application.workAddress = workAddressController.text.trim();

      application.nationalityId = 1;
      //nationalityController.text.trim() as int;

      application.stateId = 4;
      //stateController.text.trim() as int?;

      application.residenceCountryId = 232;
      //countryController.text.trim() as int?;
      application.residenceStateId = 231;
      //stateOfResidenceController.text.trim() as int?;
      GlobalVariables.applications.value = application;
      print('${GlobalVariables.applications.value.identificationNumber}');
      print('${GlobalVariables.applications.value.permanentAddress}');

      onNextPressed();
    } else {
      WidgetHelper.showToastError(context, "Fill required field.");
      return;
    }
  }

  @override
  bool get wantKeepAlive => true;
}

import 'dart:developer';

import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../screen_views/scratch_card.dart';

class ScratchCard extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ScratchCard({Key? key}) : super(key: key);

  @override
  ScratchCardController createState() => ScratchCardController();
}

class ScratchCardController extends State<ScratchCard> {
  //... //Initialization code, state vars etc, all go here

  String selectedValue = "";
  final TextEditingController scratchCardController = TextEditingController();

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScratchCardView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  void validateCard() {
    var cardNumber = scratchCardController.text.trim();

    if (cardNumber.isEmpty || cardNumber.length != 16) {
      WidgetHelper.showToastError(context, "Incorrect Card Pin.");
      return;
    }
    verifyPin(cardNumber);
  }

  void verifyPin(String cardNumber) async {
    try {
      WidgetHelper.showProgress(text: 'Checking Pin');
      log("hfhf");
      WidgetHelper.hideProgress();
    } catch (e) {}
  }
}

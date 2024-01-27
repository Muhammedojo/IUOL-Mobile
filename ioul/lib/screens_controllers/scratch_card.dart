import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/verify_scratch_pin/verify_scratch_pin_cubit.dart';
import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../model/model.dart';
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

    if (cardNumber.isEmpty
        //|| cardNumber.length != 16
        ) {
      WidgetHelper.showToastError(context, "Incorrect Card Pin.");
      return;
    }
    verifyPin(cardNumber);
  }

  void verifyPin(String cardNumber) async {
    try {
      WidgetHelper.showProgress(text: 'Checking Pin');
      final VerifyScratchCardPin data = VerifyScratchCardPin();
      data.pin = cardNumber;
      context.read<VerifyScratchPinCubit>().pushPinToServer(data);
      WidgetHelper.hideProgress();
    } catch (e) {
      WidgetHelper.hideProgress();
    }
  }
}

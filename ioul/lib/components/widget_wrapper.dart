//import '../helpers/helper.dart' hide Key;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ioul/values/values.dart';

class WidgetWrapper extends StatelessWidget {
  final Widget child;

  const WidgetWrapper({Key? key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // padding: MediaQuery.of(context).padding,
          color: AppColors.skyLightest,
          child: SvgPicture.asset(
            "assets/images/general_background.svg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}

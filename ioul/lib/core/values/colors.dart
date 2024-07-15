import 'dart:ui';

class AppColors {
  static final AppColors _instance = AppColors._internal();

  factory AppColors() {
    return _instance;
  }

  AppColors._internal() {
    // initialization logic
  }

  //Light Color
  static const Color primaryBlue = Color.fromRGBO(144, 205, 255, 1);
  static const Color backgroundWhite = Color.fromRGBO(255, 255, 255, 1);
  static const Color lightBlue = Color.fromRGBO(231, 244, 255, 1);
  static const Color blueBase = Color.fromRGBO(78, 175, 255, 1);
  static const Color secondaryLightBlue = Color.fromRGBO(196, 228, 255, 1);
  static const Color greylight = Color.fromRGBO(25, 28, 28, 0.70);
  static const Color primary = Color(0xFF25435B);
  static const Color brownBlack = Color.fromRGBO(51, 51, 51, 1);
  static const Color lightBlack = Color.fromRGBO(153, 153, 153, 1);
  static const Color lightGrey = Color.fromRGBO(227, 229, 229, 1);
  static const Color textLight = Color(0xff303437);
  static const Color skyLightest = Color(0xFFF7F9FA);
  static const Color inkDarkest = Color(0xff090A0A);
  static const Color inkDarker = Color(0xff202325);
  static const Color inkLighter = Color(0xff72777A);
  static const Color inkLight = Color(0xffE3E5E5);
  static const Color primaryBase = Color(0xff4EAFFF);
  static const Color primaryLightest = Color(0xffE7F4FF);
  static const Color skyLighter = Color(0xffF2F4F5);
  static const Color inkBase = Color(0xff404446);
  static const Color skyDark = Color(0xff979C9E);

//Dark color

  static const Color primaryBlueDark = Color.fromRGBO(144, 205, 255, 1);
  static const Color backgroundWhiteDark = Color.fromRGBO(255, 255, 255, 1);
  static const Color lightBlueDark = Color.fromRGBO(231, 244, 255, 1);
  static const Color blueBaseDark = Color.fromRGBO(78, 175, 255, 1);
  static const Color secondaryLightBlueDark = Color.fromRGBO(196, 228, 255, 1);
  static const Color greylightDark = Color.fromRGBO(25, 28, 28, 0.70);
  static const Color primaryDark = Color(0xFF25435B);
  static const Color brownBlackDark = Color.fromRGBO(51, 51, 51, 1);
  static const Color lightBlackDark = Color.fromRGBO(153, 153, 153, 1);
  static const Color lightGreyDark = Color.fromRGBO(227, 229, 229, 1);
  static const Color textLightDark = Color(0xff303437);
  static const Color skyLightestDark = Color(0xFFF7F9FA);
  static const Color inkDarkestDark = Color(0xff090A0A);
  static const Color inkDarkerDark = Color(0xff202325);
  static const Color inkLighterDark = Color(0xff72777A);
  static const Color inkLightDark = Color(0xffE3E5E5);
  static const Color primaryBaseDark = Color(0xff4EAFFF);
  static const Color primaryLightestDark = Color(0xffE7F4FF);
  static const Color skyLighterDark = Color(0xffF2F4F5);
  static const Color inkBaseDark = Color(0xff404446);
  static const Color skyDarkDark = Color(0xff979C9E);

  //Shadow Color
  static const Color sBoxDark = Color.fromRGBO(0, 0, 0, 0.05);
  static const Color sBoxLight = Color.fromRGBO(158, 158, 158, 0.5);
}

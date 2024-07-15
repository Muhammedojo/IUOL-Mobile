import '../packages/package.dart';
import '../values/values.dart';

class ThemeManager extends CustomThemeData {
  static ThemeManager of(BuildContext context) => CustomThemes.safeOf(
        context,
        mainDefault: const ThemeManager(),
        darkDefault: const ThemeManager.dark(),
      );

  final Color? primaryBlue;
  final Color? backgroundWhite;
  final Color? lightBlue;
  final Color? blueBase;
  final Color? secondaryLightBlue;
  final Color? greylight;
  final Color? primary;
  final Color? brownBlack;
  final Color? lightBlack;
  final Color? lightGrey;
  final Color? textLight;
  final Color? skyLightest;
  final Color? inkDarkest;
  final Color? inkDarker;
  final Color? inkLighter;
  final Color? inkLight;
  final Color? primaryBase;
  final Color? primaryLightest;
  final Color? skyLighter;
  final Color? inkBase;
  final Color? skyDark;

  const ThemeManager(
      {this.backgroundWhite = AppColors.backgroundWhite,
      this.lightBlue = AppColors.lightBlue,
      this.blueBase = AppColors.blueBase,
      this.secondaryLightBlue = AppColors.secondaryLightBlue,
      this.greylight = AppColors.greylight,
      this.primary = AppColors.primary,
      this.brownBlack = AppColors.brownBlack,
      this.lightBlack = AppColors.lightBlack,
      this.lightGrey = AppColors.lightGrey,
      this.textLight = AppColors.textLight,
      this.skyLightest = AppColors.skyLightest,
      this.inkDarkest = AppColors.inkDarkest,
      this.inkDarker = AppColors.inkDarker,
      this.inkLighter = AppColors.inkLighter,
      this.inkLight = AppColors.inkLight,
      this.primaryBase = AppColors.primaryBase,
      this.primaryLightest = AppColors.primaryLightest,
      this.skyLighter = AppColors.skyLighter,
      this.inkBase = AppColors.inkBase,
      this.skyDark = AppColors.skyDark,
      this.primaryBlue = AppColors.primaryBlue});

  const ThemeManager.dark(
      {this.backgroundWhite = AppColors.backgroundWhiteDark,
      this.lightBlue = AppColors.lightBlueDark,
      this.blueBase = AppColors.blueBaseDark,
      this.secondaryLightBlue = AppColors.secondaryLightBlueDark,
      this.greylight = AppColors.greylightDark,
      this.primary = AppColors.primaryDark,
      this.brownBlack = AppColors.brownBlackDark,
      this.lightBlack = AppColors.lightBlackDark,
      this.lightGrey = AppColors.lightGreyDark,
      this.textLight = AppColors.textLightDark,
      this.skyLightest = AppColors.skyLightestDark,
      this.inkDarkest = AppColors.inkDarkestDark,
      this.inkDarker = AppColors.inkDarkerDark,
      this.inkLighter = AppColors.inkLighterDark,
      this.inkLight = AppColors.inkLightDark,
      this.primaryBase = AppColors.primaryBaseDark,
      this.primaryLightest = AppColors.primaryLightestDark,
      this.skyLighter = AppColors.skyLighterDark,
      this.inkBase = AppColors.inkBaseDark,
      this.skyDark = AppColors.skyDarkDark,
      this.primaryBlue = AppColors.primaryBlueDark});
}

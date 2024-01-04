import '../packages/package.dart';
import '../values/values.dart';

class CustomTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      fontFamily: 'Inter',
      // useMaterial3: true,
      primarySwatch: Colors.blue,
      textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
        fontFamily: 'Inter',
        useMaterial3: true,
        primarySwatch: Colors.blue,
        textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: AppColors.primary,
          background: Colors.black,
        ));
  }
}

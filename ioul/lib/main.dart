import 'package:ioul/core/packages/package.dart';
import 'package:ioul/ioul_app.dart';
import 'package:ioul/core/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: GlobalVariables().appLocales,
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      saveLocale: true,
      startLocale: const Locale('en', 'US'),
      useFallbackTranslations: true,
      useOnlyLangCode: true,
      child: const IOULApp()));
}

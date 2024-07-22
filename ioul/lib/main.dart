import 'core/core.dart';
import 'ioul_app.dart';

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

import 'package:flutter_test/flutter_test.dart';
import 'package:ioul/core/core.dart';

void globalSetUp() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.setMockInitialValues({});
  await dotenv.load(fileName: "assets/.env");
}

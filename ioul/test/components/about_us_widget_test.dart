import 'package:flutter_test/flutter_test.dart';
import 'package:ioul/components/components.dart';
import 'package:ioul/core/core.dart';

void main() {
  List<MediaQueryData> testScreenSizes = const [
    MediaQueryData(size: Size(320, 568)), // iPhone 5s
    MediaQueryData(size: Size(375, 667)), // iPhone 8
    MediaQueryData(size: Size(414, 896)), // iPhone 11 Pro Max
    MediaQueryData(size: Size(768, 1024)), // iPad Air
    MediaQueryData(size: Size(1024, 1366)), // MacBook Air
  ];
  testWidgets('about us widget ...', (tester) async {
    for (var screenSize in testScreenSizes) {
      await tester.pumpWidget(ScreenUtilInit(
          designSize: screenSize.size,
          builder: (context, child) => MaterialApp(
                home: Material(
                    child: AboutUsWidget(
                  title: '',
                  onTap: () {},
                )),
              )));
    }
  });
}

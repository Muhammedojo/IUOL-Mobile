import 'package:flutter_test/flutter_test.dart';
import 'package:ioul/core/core.dart';
import 'package:ioul/features/dashboard/presentation/bloc/bloc.dart';
import 'package:ioul/features/dashboard/presentation/controller/notification_controller.dart';

import '../../../../test_helper.dart';

void main() {
  List<MediaQueryData> testScreenSizes = const [
    MediaQueryData(size: Size(320, 568)), // iPhone 5s
    MediaQueryData(size: Size(375, 667)), // iPhone 8
    MediaQueryData(size: Size(414, 896)), // iPhone 11 Pro Max
    MediaQueryData(size: Size(768, 1024)), // iPad Air
    MediaQueryData(size: Size(1024, 1366)), // MacBook Air
  ];
  globalSetUp();
  setUp(() async {});
  group("Notification Page Responsivness Test", () {
    testWidgets('notification view ...', (tester) async {
      for (var screenSize in testScreenSizes) {
        await tester.pumpWidget(MultiBlocProvider(
          providers: [
            BlocProvider<NotificationCubit>(
              create: (BuildContext context) => NotificationCubit(),
            ),
          ],
          child: ScreenUtilInit(
              designSize: screenSize.size,
              builder: (context, child) =>
                  const MaterialApp(home: Notifications())),
        ));
      }
    });
  });
}

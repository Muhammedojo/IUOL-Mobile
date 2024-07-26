import 'package:flutter_test/flutter_test.dart';
import 'package:ioul/core/core.dart';
import 'package:ioul/features/courses/presentation/bloc/bloc.dart';
import 'package:ioul/features/dashboard/presentation/bloc/bloc.dart';
import 'package:ioul/features/dashboard/presentation/bloc/user/cubit.dart';
import 'package:ioul/features/dashboard/presentation/controller/dashboard_controller.dart';

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
  group("DashBoard Responsivness Test", () {
    testWidgets('dashboard view ...', (tester) async {
      for (var screenSize in testScreenSizes) {
        await tester.pumpWidget(MultiBlocProvider(
          providers: [
            BlocProvider<UserCubit>(
              create: (BuildContext context) => UserCubit(),
            ),
            BlocProvider<CoursesCubit>(
              create: (BuildContext context) => CoursesCubit(),
            ),
            BlocProvider<UpcomingTaskCubit>(
              create: (BuildContext context) => UpcomingTaskCubit(),
            ),
          ],
          child: ScreenUtilInit(
              designSize: screenSize.size,
              builder: (context, child) =>
                  const MaterialApp(home: Dashboard())),
        ));
      }
    });
  });
}

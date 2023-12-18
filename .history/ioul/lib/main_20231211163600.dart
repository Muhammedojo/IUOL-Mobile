<<<<<<< HEAD
import 'package:ioul/router/router.dart';
=======
import '../router/router.dart';
>>>>>>> 4abf735e06d6b5923b4ff19c31e82f31fdbe59fd
import 'packages/package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            title: '',
            theme: ThemeData(
              fontFamily: 'Inter',
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
          );
        });
  }
}

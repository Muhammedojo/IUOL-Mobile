import 'package:flutter/material.dart';
import 'package:ioul/screens/screens.dart';
import 'packages/package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: '',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp),
              ),
              home: const SplashScreen(),
            );
          });
  }
}

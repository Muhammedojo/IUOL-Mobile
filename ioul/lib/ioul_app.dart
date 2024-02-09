import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ioul/bloc/bloc.dart';

import 'packages/package.dart';
import 'router/router.dart';
import 'utils/theme.dart';

class IOULApp extends StatelessWidget {
  const IOULApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiBlocProvider(
        providers: [
          BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(),
          ),
          BlocProvider<VerifyEmailCubit>(
            create: (BuildContext context) => VerifyEmailCubit(),
          ),
          BlocProvider<ResendEmailVerificationCubit>(
            create: (BuildContext context) => ResendEmailVerificationCubit(),
          ),
          BlocProvider<VerifyScratchPinCubit>(
            create: (BuildContext context) => VerifyScratchPinCubit(),
          ),
          BlocProvider<SubmitApplicationCubit>(
            create: (BuildContext context) => SubmitApplicationCubit(),
          )
        ],
        child: ScreenUtilInit(
            designSize: const Size(428, 926),
            minTextAdapt: true,
            splitScreenMode: false,
            rebuildFactor: (old, data) {
              return true;
            },
            builder: (context, child) {
              return MaterialApp.router(
                builder: EasyLoading.init(),
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                title: 'IOUL',
                theme:
                    // ThemeData(
                    //   fontFamily: 'Inter',
                    //   primarySwatch: Colors.blue,
                    //   textTheme:
                    //       Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
                    // ),
                    CustomTheme.lightThemeData(context),
                darkTheme: CustomTheme.darkThemeData(),
                themeMode: ThemeMode.system,
              );
            }));
  }
}

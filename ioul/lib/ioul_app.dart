import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ioul/bloc/bloc.dart';
import 'package:ioul/bloc/verify_email.com/verify_email_cubit.dart';

import 'packages/package.dart';
import 'router/router.dart';

class IOULApp extends StatelessWidget {
  const IOULApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(),
          ),
          BlocProvider<VerifyEmailCubit>(
            create: (BuildContext context) => VerifyEmailCubit(),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(428, 926),
            minTextAdapt: true,
            splitScreenMode: false,
            builder: (context, child) {
              return MaterialApp.router(
                builder: EasyLoading.init(),
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                title: '',
                theme: ThemeData(
                  fontFamily: 'Inter',
                  primarySwatch: Colors.blue,
                  textTheme:
                      Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
                ),
              );
            }));
  }
}

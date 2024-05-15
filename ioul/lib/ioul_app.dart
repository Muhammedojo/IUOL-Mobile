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
          BlocProvider<CountryCubit>(
            create: (BuildContext context) => CountryCubit(),
          ),
          BlocProvider<ApplicationFormDataCubit>(
            create: (BuildContext context) => ApplicationFormDataCubit(),
          ),
          BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(),
          ),
          BlocProvider<VerifyEmailCubit>(
            create: (BuildContext context) => VerifyEmailCubit(),
          ),
          BlocProvider<CoursesCubit>(
            create: (BuildContext context) => CoursesCubit(),
          ),
          BlocProvider<ResendEmailVerificationCubit>(
            create: (BuildContext context) => ResendEmailVerificationCubit(),
          ),
          BlocProvider<VerifyScratchPinCubit>(
            create: (BuildContext context) => VerifyScratchPinCubit(),
          ),
          BlocProvider<UserCubit>(
            create: (BuildContext context) => UserCubit(),
          ),
          BlocProvider<AssignmentCubit>(
            create: (BuildContext context) => AssignmentCubit(),
          ),
          BlocProvider<PaymentTypeCubit>(
            create: (BuildContext context) => PaymentTypeCubit(),
          ),
          BlocProvider<ReportCubit>(
            create: (BuildContext context) => ReportCubit(),
          ),
          BlocProvider<CourseRegCubit>(
            create: (BuildContext context) => CourseRegCubit(),
          ),
          BlocProvider<SubmitApplicationCubit>(
            create: (BuildContext context) => SubmitApplicationCubit(),
          ),
          BlocProvider<CourseAudioResourcesCubit>(
            create: (BuildContext context) => CourseAudioResourcesCubit(),
          ),
          BlocProvider<CourseVideoResourcesCubit>(
            create: (BuildContext context) => CourseVideoResourcesCubit(),
          ),
          BlocProvider<CourseDocumentResourcesCubit>(
            create: (BuildContext context) => CourseDocumentResourcesCubit(),
          ),
          BlocProvider<CourseDetailsResourcesCubit>(
            create: (BuildContext context) => CourseDetailsResourcesCubit(),
          ),
          BlocProvider<PaymentHistoryCubit>(
            create: (BuildContext context) => PaymentHistoryCubit(),
          ),
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
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  debugShowCheckedModeBanner: false,
                  routerConfig: AppRouter.router,
                  title: 'IOUL',
                  theme: CustomTheme.lightThemeData(context),
                  darkTheme: CustomTheme.darkThemeData(),
                  themeMode: ThemeMode.system,
                  builder: EasyLoading.init(builder: (context, child) {
                    EasyLoading.init();
                    ResponsiveBreakpoints.builder(
                      child: child!,
                      breakpoints: [
                        const Breakpoint(start: 0, end: 450, name: MOBILE),
                        const Breakpoint(start: 451, end: 800, name: TABLET),
                        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                        const Breakpoint(
                            start: 1921, end: double.infinity, name: '4K'),
                      ],
                    );
                    return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                            textScaleFactor:
                                MediaQuery.of(context).size.width > 428
                                    ? 1
                                    : 1.2),
                        child: child);
                  }));
            }));
  }
}

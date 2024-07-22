import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/core.dart';
import 'features/assignments/presentation/bloc/bloc.dart';
import 'features/auth/presentation/bloc/bloc.dart';
import 'features/courses/presentation/bloc/bloc.dart';
import 'features/dashboard/presentation/bloc/bloc.dart';
import 'features/more/presentation/bloc/bloc.dart';
import 'features/onboarding/presentation/bloc/bloc.dart';
import 'features/reports/presentation/bloc/bloc.dart';

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
          BlocProvider<ApplicationPaymentCubit>(
            create: (BuildContext context) => ApplicationPaymentCubit(),
          ),
          BlocProvider<NotificationCubit>(
            create: (BuildContext context) => NotificationCubit(),
          ),
          BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(),
          ),
          BlocProvider<UpcomingTaskCubit>(
            create: (BuildContext context) => UpcomingTaskCubit(),
          ),
          BlocProvider<JournalCubit>(
            create: (BuildContext context) => JournalCubit(),
          ),
          BlocProvider<CollectionCubit>(
            create: (BuildContext context) => CollectionCubit(),
          ),
          BlocProvider<VerifyEmailCubit>(
            create: (BuildContext context) => VerifyEmailCubit(),
          ),
          BlocProvider<CoursesCubit>(
            create: (BuildContext context) => CoursesCubit(),
          ),
          BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit(),
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
                  // theme: CustomTheme.lightThemeData(context),
                  // darkTheme: CustomTheme.darkThemeData(),
                  // themeMode: ThemeMode.system,
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
                        textScaler: MediaQuery.of(context).size.width > 428
                            ? TextScaler.noScaling
                            : const TextScaler.linear(1.2),
                      ),
                      child: child,
                    );
                  }));
            }));
  }
}

import 'package:ioul/router/route_constants.dart';
import 'package:ioul/screens/screens.dart';
import 'package:ioul/screens_controllers/more_controller.dart';
import 'package:ioul/screens_controllers/programme_view.dart';
import 'package:ioul/screens_controllers/reset_password.dart';
import 'package:ioul/screens_controllers/scratch_card.dart';
import 'package:ioul/screens_controllers/sponsor_view.dart';
import 'package:ioul/screens_controllers/upload_view.dart';


import '../packages/package.dart';
import '../utils/global_variables.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: GlobalVariables.rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: RouteConstants.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/${RouteConstants.login}',
        name: RouteConstants.login,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/${RouteConstants.forgotPassword}',
        name: RouteConstants.forgotPassword,
        builder: (context, state) => const ForgotPassword(),
      ),
      GoRoute(
        path: '/${RouteConstants.codeInput}',
        name: RouteConstants.codeInput,
        builder: (context, state) => const CodeInput(),
      ),
      GoRoute(
        path: '/${RouteConstants.resetPassword}',
        name: RouteConstants.resetPassword,
        builder: (context, state) => const ResetPassword(),
      ),
      GoRoute(
        path: '/${RouteConstants.createAccount}',
        name: RouteConstants.createAccount,
        builder: (context, state) => const CreateAccount(),
      ),
      GoRoute(
        path: '/${RouteConstants.accountVerification}',
        name: RouteConstants.accountVerification,
        builder: (context, state) => const VerifyEmail(),
      ),
      GoRoute(
        path: '/${RouteConstants.admissionPayment}',
        name: RouteConstants.admissionPayment,
        builder: (context, state) => const AdmissionPayment(),
      ),
      GoRoute(
        path: '/${RouteConstants.scratchCard}',
        name: RouteConstants.scratchCard,
        builder: (context, state) => const ScratchCard(),
      ),
      GoRoute(
        path: '/${RouteConstants.applicationConfirmation}',
        name: RouteConstants.applicationConfirmation,
        builder: (context, state) => const ApplicationConfirmation(),
      ),
      GoRoute(
        path: '/${RouteConstants.applicationForm}',
        name: RouteConstants.applicationForm,
        builder: (context, state) => const ApplicationForm(),
        routes: [
          GoRoute(
            path: RouteConstants.personal,
            name: RouteConstants.personal,
            builder: (context, state) => Personal(),
          ),
          GoRoute(
            path: RouteConstants.address,
            name: RouteConstants.address,
            builder: (context, state) => const Address(),
          ),
          GoRoute(
            path: RouteConstants.contacts,
            name: RouteConstants.contacts,
            builder: (context, state) => const Contact(),
          ),
          GoRoute(
            path: RouteConstants.sponsor,
            name: RouteConstants.sponsor,
            builder: (context, state) => const Sponsor(),
          ),
          GoRoute(
            path: RouteConstants.programme,
            name: RouteConstants.programme,
            builder: (context, state) => const Programme(),
          ),
          GoRoute(
            path: RouteConstants.certificates,
            name: RouteConstants.certificates,
            builder: (context, state) => const Certificate(),
          ),
          GoRoute(
            path: RouteConstants.uploads,
            name: RouteConstants.uploads,
            builder: (context, state) => const Upload(),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Home(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: GlobalVariables().shellNavigatorCourseKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/${RouteConstants.courses}',
                name: RouteConstants.courses,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Course(),
                ),
                routes:  [
                  GoRoute(
                    path: RouteConstants.courseDetailOverview,
                    name: RouteConstants.courseDetailOverview,
                    builder: (context, state) => const CourseOverview(),
                  ),
                  // GoRoute(
                  //   path: RouteConstants.ioulLibrary,
                  //   name: RouteConstants.ioulLibrary,
                  //   builder: (context, state) => const IOULLibrary(),
                  // ),

                  // GoRoute(
                  //   path: RouteConstants.paymentHistoryInvoice,
                  //   name: RouteConstants.paymentHistoryInvoice,
                  //   builder: (context, state) => const PaymentHistoryInvoice(),
                  // ),
                  // GoRoute(
                  //   path: RouteConstants.assignmentPreview,
                  //   name: RouteConstants.assignmentPreview,
                  //   builder: (context, state) => const AssignmentPreview(),
                  // ),
                  // GoRoute(
                  //   path: RouteConstants.reportPreview,
                  //   name: RouteConstants.reportPreview,
                  //   builder: (context, state) => const ReportPreview(),
                  // ),
                  // GoRoute(
                  //   path: RouteConstants.documentResources,
                  //   name: RouteConstants.documentResources,
                  //   builder: (context, state) => const DocumentResources(),
                  // ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalVariables().shellNavigatorAssignmentKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/${RouteConstants.assignment}',
                name: RouteConstants.assignment,
                // parentNavigatorKey: GlobalVariables.rootNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Assignment(),
                ),
                routes: const [
                  // child route
                  // GoRoute(
                  //   path: 'details',
                  //   builder: (context, state) =>
                  //       const DetailsScreen(label: 'A'),
                  // ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalVariables().shellNavigatorReportKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/${RouteConstants.report}',
                name: RouteConstants.report,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Report(),
                ),
                routes: const [
                  // child route
                  // GoRoute(
                  //   path: 'details',
                  //   builder: (context, state) =>
                  //       const DetailsScreen(label: 'A'),
                  // ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalVariables().shellNavigatorMoreKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/${RouteConstants.more}',
                name: RouteConstants.more,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: More(),
                ),
                routes: const [
                  // child route
                  // GoRoute(
                  //   path: 'details',
                  //   builder: (context, state) =>
                  //       const DetailsScreen(label: 'A'),
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

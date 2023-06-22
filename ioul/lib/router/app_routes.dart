import 'package:ioul/router/route_constants.dart';
import 'package:ioul/screens/screens.dart';
import 'package:ioul/screens_controllers/assignment_controller.dart';
import 'package:ioul/screens_controllers/course_controller.dart';
import 'package:ioul/screens_controllers/create_account.dart';
import 'package:ioul/screens_controllers/forgot_password_controller.dart';
import 'package:ioul/screens_controllers/home_controller.dart';
import 'package:ioul/screens_controllers/login_controller.dart';
import 'package:ioul/screens_controllers/more_controller.dart';
import 'package:ioul/screens_controllers/report_controller.dart';
import 'package:ioul/screens_controllers/reset_password.dart';
import 'package:ioul/screens_controllers/verify_email_controller.dart';

import '../packages/package.dart';
import '../screens_controllers/code_input_controller.dart';
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
                routes: const [
                  // child route
                  // GoRoute(
                  //   path: RouteConstants.home,
                  //   name: RouteConstants.home,
                  //   builder: (context, state) => const Course(),
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

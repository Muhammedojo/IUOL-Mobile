import 'package:ioul/router/route_constants.dart';
import 'package:ioul/screen_views/payment.dart';
import 'package:ioul/screens/screens.dart';
import 'package:ioul/screens_controllers/more_controller.dart';
import 'package:ioul/screens_controllers/profile.dart';
import 'package:ioul/screens_controllers/programme_controller.dart';
import 'package:ioul/screens_controllers/scratch_card.dart';
import 'package:ioul/screens_controllers/sponsor_controller.dart';
import 'package:ioul/screens_controllers/upload_controller.dart';

import '../packages/package.dart';
import '../utils/global_variables.dart';

class AppRouter {
  // var email;
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
        builder: (context, state) => CodeInput(email: state.extra as String),
      ),
      // GoRoute(
      //   path: '/${RouteConstants.resetPassword}',
      //   name: RouteConstants.resetPassword,
      //   builder: (context, state) =>  ResetPassword(),
      // ),
      GoRoute(
        path: '/${RouteConstants.createAccount}',
        name: RouteConstants.createAccount,
        builder: (context, state) => const CreateAccount(),
      ),
      GoRoute(
        path: '/${RouteConstants.accountVerification}',
        name: RouteConstants.accountVerification,
        builder: (context, state) => VerifyEmail(
          email: state.extra as String,
        ),
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
        path: '/${RouteConstants.payments}',
        name: RouteConstants.payments,
        builder: (context, state) => const Payments(""),
      ),
      GoRoute(
        path: '/${RouteConstants.applicationConfirmation}',
        name: RouteConstants.applicationConfirmation,
        builder: (context, state) => const ApplicationConfirmation(),
      ),
      GoRoute(
        path: '/${RouteConstants.profile}',
        name: RouteConstants.profile,
        builder: (context, state) => const Profile(),
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
          GoRoute(
            path: RouteConstants.reviewApplication,
            name: RouteConstants.reviewApplication,
            builder: (context, state) => const ReviewApplication(),
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
                path: '/${RouteConstants.dashboard}',
                name: RouteConstants.dashboard,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Dashboard(),
                ),
                routes: [
                  GoRoute(
                    path: RouteConstants.notification,
                    name: RouteConstants.notification,
                    builder: (context, state) => const Notifications(),
                  ),
                  GoRoute(
                    path: RouteConstants.userProfile,
                    name: RouteConstants.userProfile,
                    builder: (context, state) => const UserProfile(),
                  ),
                ],
              ),
            ],
          ),
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
                routes: [
                  // GoRoute(
                  //   path: RouteConstants.helpDesk,
                  //   name: RouteConstants.helpDesk,
                  //   builder: (context, state) => const HelpDesk(),
                  // ),
                  // GoRoute(
                  //   path: RouteConstants.settings,
                  //   name: RouteConstants.settings,
                  //   builder: (context, state) => const Settings(),
                  // ),
                  // GoRoute(
                  //   path: RouteConstants.about,
                  //   name: RouteConstants.about,
                  //   builder: (context, state) => const About(),
                  // ),
                  // GoRoute(
                  //   path: RouteConstants.testReset,
                  //   name: RouteConstants.testReset,
                  //   builder: (context, state) => const TestReset(),
                  // ),
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
                  GoRoute(
                    path: RouteConstants.audioResources,
                    name: RouteConstants.audioResources,
                    builder: (context, state) => const AudioResources(),
                  ),
                  GoRoute(
                    path: RouteConstants.audio,
                    name: RouteConstants.audio,
                    builder: (context, state) => const Audio(),
                  ),
                  GoRoute(
                    path: RouteConstants.videoResources,
                    name: RouteConstants.videoResources,
                    builder: (context, state) => const VideoResources(),
                  ),
                  GoRoute(
                    path: RouteConstants.documentResources,
                    name: RouteConstants.documentResources,
                    builder: (context, state) => const DocumentResources(),
                  ),
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
                routes: [
                  GoRoute(
                    path: RouteConstants.assignmentPreview,
                    name: RouteConstants.assignmentPreview,
                    builder: (context, state) => const AssignmentPreview(),
                  ),
                  GoRoute(
                    path: RouteConstants.reportPreview,
                    name: RouteConstants.reportPreview,
                    builder: (context, state) => const ReportPreview(),
                  ),
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

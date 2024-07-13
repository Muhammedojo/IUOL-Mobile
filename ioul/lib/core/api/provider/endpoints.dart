import 'dart:core';

//EndPoints
const bool liveServer = false;
const baseUrl = liveServer
    ? "https://iconicuniversity.edu.ng"
    : "https://test-portal.iconicuniversity.edu.ng/";
const String campusBaseUrl = "https://test-campus.iconicuniversity.edu.ng";
const String baseApi = "$baseUrl/api/students/v1/";
const String campusBaseApi = "$campusBaseUrl/api/students/v1/";
const String paymentHistoryEndpoint = 'payment-history';
const String applicationPaymentLink = "application/application-form/payment";
const String loginEndpoint = "auth/login";
const String registerEndpoint = "auth/register";
const String verifyEmailEndpoint = "auth/verify-email";
const String forgotPasswordEndpoint = "auth/forgot-password";
const String countries = "application/countries";
const String coursesAssignment = "courses/assignments";
const String coursesReport = "courses/reports";
const String resendEmailVerificationEndpoint = "auth/resend-email-verification";
const String verifyResetPasswordPin = "auth/verify-reset-password-pin";
const String resetPasswordEndpoint = "auth/reset-password";
const String logoutEndpoint = "auth/logout";
//Endpoint to fetch programs list
const String startApplication = "application/start";
const String collectionsEndpoint = "virtual-library/collection";
const String journalsEndpoint = "virtual-library/journals";
const String applicationFormData = "application/form-data";
const String coursesEndpoint = "courses";
const String notificationsEndpoint = "home/notifications";
const String upcomingAssignmentEndpoint = "home";
const String courseVideoEndpoint = "courses/13/resources/video-resources";
const String courseAudioEndpoint = "courses/13/resources/audio-resources";
const String courseDocumentEndpoint = "courses/13/resources/document-resources";
const String courseDetailsEndpoint = "courses/13";
const String verifyScratchCardPinEndpoint = "application/pin/verify";
const String state = "application/states/233";
const String submitApplication = "application";
//Endpoint to get prefilled semester data
const String semesterFormData = "registration/semester";
const String submitSemesterRegistration = "registration/semester";
const String registerCourse = "registration/course";
const String paymentTypes = "payment";
const String makeSemesterPayment = "payment/semester/semester-fee";
const String lateCourseRegistrationPayment =
    "payment/semester/late-course-registration";
const String getPaymentHistoryEndpoint = "payment/history";

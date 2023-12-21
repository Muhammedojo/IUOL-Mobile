import 'dart:core';

//EndPoints
const bool liveServer = false;
const baseUrl = liveServer
    ? "https://iconicuniversity.edu.ng"
    : "https://test-portal.iconicuniversity.edu.ng/";
const String baseApi = "$baseUrl/api/students/v1/";
const String paymentHistoryEndpoint = 'payment-history';
const String loginEndpoint = "auth/login";
const String registerEndpoint = "auth/register";
const String verifyEmail = "auth/verify-email";
const String forgotPassword = "auth/forgot-password";
const String countries = "application/countries";
const String resendEmailVerification = "auth/resend-email-verification";
const String verifyResetPasswordPin = "verify-reset-password-pin";
const String resetPassword = "auth/reset-password";
const String logout = "auth/logout";
//Endpoint to fetch programs list
const String startApplication = "application/start";

const String applicationFormData = "application/form-data";

const String verifyScratchCardPin = "application/pin/verify";
const String state = "application/states/233";
const String submitApplication = "application/submit";
//Endpoint to get prefilled semester data
const String semesterFormData = "registration/semester";
const String submitSemesterRegistration = "registration/semester";
const String registerCourse = "registration/course";
const String paymentTypes = "payment";
const String makeSemesterPayment = "payment/semester/semester-fee";
const String lateCourseRegistrationPayment =
    "payment/semester/late-course-registration";
const String getPaymentHistory = "payment/history";

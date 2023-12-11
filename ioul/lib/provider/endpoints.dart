const LIVE_MODE = false;
const BASE_URL = LIVE_MODE
    ? "http://pfinigeria.com"
    : "https://test-portal.iconicuniversity.edu.ng/";
const BASE_API = "$BASE_URL/api/students/v1/";

const ENDPOINT_LOGIN = "auth/login";
const ENDPOINT_REGISTER = "auth/register";
const ENDPOINT_VERIFY_EMAIL = "auth/verify-email";
const ENDPOINT_FORGOT_PASSWORD = "auth/forgot-password";
const ENDPOINT_GET_COUNTRIES = "application/countries";

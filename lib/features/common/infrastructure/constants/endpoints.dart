/// Base Url for http requests
const String httpBaseUrl = String.fromEnvironment(
  'HTTP_BASE_URL',
  defaultValue: 'https://api.example.com',
);

//
// /// Authentication
// /// Login user via phone number and token
// const String loginCheckOtpUrl = '/api/users/otp';
//
// /// Login user via phone number and token
// const String loginUserUrl = '/realms/rimcab/protocol/openid-connect/token';
//
// /// Logout
// const String logoutUserUrl = '/realms/rimcab/protocol/openid-connect/logout';
//
// /// Signup user via phone number
// const String registerUserUrl = '/api/users/signup';
//
// /// Send authentication OTP code
// const String resendVerificationCodeUrl = '/api/users/otp';
//
// /// retrieve user
// const String retrieveUserUrl = '/hello'; // TODO(hello): temporary endpoint

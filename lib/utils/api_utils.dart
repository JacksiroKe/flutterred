class ApiConstants {
  static const String octetStream = "application/octet-stream";
  static const String baseUrl = "https://jsonplaceholder.typicode.com/";
}

class ApiStrings {
  static const String areYouConnected = "Are you connected?";
  static const String noInternetConnection = "No Internet Connection";
  static const String noInternetMessage = "Oops! This is heart breaking. Its seems like you don't have a relaible internet connection.\n\n" +
          "Please enable your mobile data or Wi-Fi before trying again.";
  
}

class ApiOperations {
  static const String success = "success";
  static const String failure = "failure";
  static const String suspended = "suspended";
  static const String unpermited = "unpermited";
  static const String missing = "missing";
  static const String invalid = "invalid";
  static const String already = "already";

  static const String todos = "todos";
}

class EventConstants {
  static const int noInternetConnection = 0;

  static const int requestSuccessful = 300;
  static const int requestUnsuccessful = 301;
  static const int requestNotFound = 302;
  static const int requestSuspended = 303;
  static const int requestUnpermited = 304;
  static const int requestInvalid = 305;
  static const int requestTimeout = 306;

  static const int userLoginSuccessful = 500;
  static const int userLoginUnsuccessful = 501;
  static const int userNotFound = 502;
  static const int userRegisterationSuccessful = 503;
  static const int userRegisterationUnsuccessful = 504;

  static const int userAlreadyRegistered = 505;
  static const int registrationSuspended = 506;
  static const int noPermission = 507;
  static const int usernameTaken = 508;
  static const int emailTaken = 509;
  static const int registrationLimited = 510;
  static const int changePasswordSuccessful = 511;
  static const int changePasswordUnsuccessful = 512;
  static const int invalidOldPassword = 513;
}

class ApiResponseCode {
  static const int scOK = 200;
}


class Constants {

  // common
  static const String emptyString = "";
  static const String locale = "en_PH";
  static const String currencySymbol = "₱";

  // api
  static const String baseUrl = "http://192.168.1.7:3000/";
  static const Map<String, String> headers = {
    "content-type": "application/json; charset=utf-8",
    "accept": "application/json; charset=utf-8",
  };
  static const Duration apiTimeout = Duration(seconds: 30);

  // home
  static const String obscuredBalance = "₱••••••••";

  // send money
  static const int maxAmount = 10000000; // 10M
}
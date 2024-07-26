import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionChecker {
  static Future<bool> hasConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}

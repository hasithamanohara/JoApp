class AuthService {
  static Future<bool> isUserAuthenticated() async {
    // authentication check logic
    await Future.delayed(const Duration(seconds: 5));
    return false;
  }
}

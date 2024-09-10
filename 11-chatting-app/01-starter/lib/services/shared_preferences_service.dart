import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  static const String _keyLogin = "MY_LOGIN";

  bool? get isLogin => _preferences.getBool(_keyLogin);

  Future<void> login() async {
    try {
      await _preferences.setBool(_keyLogin, true);
    } catch (e) {
      throw Exception("Shared preferences cannot save the value.");
    }
  }

  Future<void> logout() async {
    try {
      await _preferences.setBool(_keyLogin, false);
    } catch (e) {
      throw Exception("Shared preferences cannot save the value.");
    }
  }
}

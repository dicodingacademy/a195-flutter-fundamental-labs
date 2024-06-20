// todo-01-service-03: create a services to handle a preferences
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/model/profile.dart';

class SharedPreferencesService {
  // todo-01-service-04: inject a preference from dependency
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  // todo-01-service-05: create a static value as a key
  static const String _keyName = "MY_NAME";
  static const String _keyEmail = "MY_EMAIL";
  static const String _keyPhoneNumber = "MY_PHONE_NUMBER";
  static const String _keyMaritalStatus = "MY_MARITAL_STATUS";

  // todo-01-service-06: add a Future function to save a profile value
  Future<void> saveProfileValue(Profile profile) async {
    // todo-01-service-07: wrap all action using try-catch
    try {
      // todo-01-service-08: save all value and make a final result
      await _preferences.setString(_keyName, profile.name);
      await _preferences.setString(_keyEmail, profile.email);
      await _preferences.setString(_keyPhoneNumber, profile.phoneNumber);
      await _preferences.setBool(_keyMaritalStatus, profile.maritalStatus);
    } catch (e) {
      // todo-01-service-09: dont forget throw an error when process failed
      throw Exception("Shared preferences cannot save the profile value.");
    }
  }

  // todo-01-service-10: add a function to get a profile value
  Profile getProfileValue() {
    return Profile(
      name: _preferences.getString(_keyName) ?? "",
      email: _preferences.getString(_keyEmail) ?? "",
      phoneNumber: _preferences.getString(_keyPhoneNumber) ?? "",
      maritalStatus: _preferences.getBool(_keyMaritalStatus) ?? false,
    );
  }
}

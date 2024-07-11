// todo-02-provider-01: create a new provider that handle dependency injection
import 'package:flutter/widgets.dart';
import 'package:shared_preferences_app/model/profile.dart';
import 'package:shared_preferences_app/services/shared_preferences_service.dart';

class SharedPreferencesProvider extends ChangeNotifier {
  // todo-02-provider-02: inject shared preference service
  final SharedPreferencesService _service;

  SharedPreferencesProvider(this._service);

  // todo-02-provider-03: add a state to load a saving process and load a getting value process
  String _message = "";
  String get message => _message;

  late Profile? _profile;
  Profile? get profile => _profile;

  // todo-02-provider-04: add a function to pass a profile value
  Future<void> saveProfileValue(Profile value) async {
    // todo-02-provider-05: wrap with try-catch and do the saving process
    try {
      await _service.saveProfileValue(value);
      _message = "Your data is saved";
      notifyListeners();
    } catch (e) {
      _message = "Failed to save your data";
      notifyListeners();
    }
  }

  // todo-02-provider-06:  add a function to get a profile
  void getProfileValue() async {
    try {
      _profile = _service.getProfileValue();
      _message = "Your data is saved";
      notifyListeners();
    } catch (e) {
      _message = "Failed to save your data";
      notifyListeners();
    }
  }
}

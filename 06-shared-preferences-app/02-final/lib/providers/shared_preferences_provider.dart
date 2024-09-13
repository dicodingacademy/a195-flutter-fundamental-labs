// todo-02-provider-01: create a new provider that handle dependency injection
import 'package:flutter/widgets.dart';
import 'package:shared_preferences_app/models/setting.dart';
import 'package:shared_preferences_app/services/shared_preferences_service.dart';

class SharedPreferencesProvider extends ChangeNotifier {
  // todo-02-provider-02: inject shared preference service
  final SharedPreferencesService _service;

  SharedPreferencesProvider(this._service);

  // todo-02-provider-03: add a state to load a saving process and load a getting value process
  String _message = "";
  String get message => _message;

  Setting? _setting;
  Setting? get setting => _setting;

  // todo-02-provider-04: add a function to pass a setting value
  Future<void> saveSettingValue(Setting value) async {
    // todo-02-provider-05: wrap with try-catch and do the saving process
    try {
      await _service.saveSettingValue(value);
      _message = "Your data is saved";
    } catch (e) {
      _message = "Failed to save your data";
    }
    notifyListeners();
  }

  // todo-02-provider-06: add a function to get a setting value
  void getSettingValue() async {
    try {
      _setting = _service.getSettingValue();
      _message = "Data successfully retrieved";
    } catch (e) {
      _message = "Failed to get your data";
    }
    notifyListeners();
  }
}

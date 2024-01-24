// todo-provider-01: create a new provider that handle dependency injection
import 'package:flutter/widgets.dart';
import 'package:sqlite_app/model/profile.dart';
import 'package:sqlite_app/services/sqlite_service.dart';

class LocalDatabaseProvider extends ChangeNotifier {
  // todo-provider-02: inject sqlite service
  final SqliteService _service;

  LocalDatabaseProvider(this._service);

  // todo-provider-03: add a state to load a saving process and load a getting value process
  String _message = "";
  String get message => _message;

  List<Profile>? _profileList;
  List<Profile>? get profileList => _profileList;

  Profile? _profile;
  Profile? get profile => _profile;

  // todo-provider-04: add a function to save a profile value
  Future<void> saveProfileValue(Profile value) async {
    try {
      final result = await _service.insertItem(value);

      final isError = result == 0;
      if (isError) {
        _message = "Failed to save your data";
        notifyListeners();
      } else {
        _message = "Your data is saved";
        notifyListeners();
      }
    } catch (e) {
      _message = "Failed to save your data";
      notifyListeners();
    }
  }

  // todo-provider-05: add a function to load all profile value
  Future<void> loadAllProfileValue() async {
    try {
      _profileList = await _service.getAllItems();
      _message = "All of your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your all data";
      notifyListeners();
    }
  }

  // todo-provider-06: add a function to load profile value based on id
  Future<void> loadProfileValueById(int id) async {
    try {
      _profile = await _service.getItemById(id);
      _message = "Your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your data";
      notifyListeners();
    }
  }

  // todo-provider-07: add a function to update profile value based on id
  Future<void> updateProfileValueById(int id, Profile value) async {
    try {
      final result = await _service.updateItem(id, value);

      final isEmptyRowUpdated = result == 0;
      if (isEmptyRowUpdated) {
        _message = "Failed to update your data";
        notifyListeners();
      } else {
        _message = "Your data is updated";
        notifyListeners();
      }
    } catch (e) {
      _message = "Failed to update your data";
      notifyListeners();
    }
  }

  // todo-provider-08: add a function to remove profile value based on id
  Future<void> removeProfileValueById(int id) async {
    try {
      await _service.removeItem(id);

      _message = "Your data is removed";
      notifyListeners();
    } catch (e) {
      _message = "Failed to remove your data";
      notifyListeners();
    }
  }
}

// todo-provider-01: create a new provider to handle a read-write file
import 'package:file_app/service/file_service.dart';
import 'package:flutter/widgets.dart';

class FileProvider extends ChangeNotifier {
  // todo-provider-02: inject a file service to this provider
  final FileService _service;

  FileProvider(this._service);

  // todo-provider-03: add a state and get method to handle a contents
  String? _contents;

  String? get contents => _contents;

  String _message = "";

  String get message => _message;

  List<String> _filesName = [];

  List<String> get filesName => _filesName;

  // todo-provider-04: add a function to save a file
  Future<void> saveFile(String filename, String contents) async {
    try {
      await _service.writeFile(filename, contents);
      _message = "File is saved";
      notifyListeners();
    } catch (e) {
      _message = e.toString();
      notifyListeners();
    }
  }

  // todo-provider-05: add a function to read a file
  Future<void> readFile(String filename) async {
    try {
      _contents = await _service.readFile(filename);
      _message = "File is read";
      notifyListeners();
    } catch (e) {
      _message = e.toString();
      notifyListeners();
    }
  }

  // todo-provider-06: add a function to read a file
  Future<void> getAllFilesInDirectory() async {
    try {
      _filesName = await _service.getFilesinDirectory();
      _message = "Files is read";
      notifyListeners();
    } catch (e) {
      _message = e.toString();
      notifyListeners();
    }
  }
}

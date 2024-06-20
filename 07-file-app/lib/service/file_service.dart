// todo-02-file-01: create a class to handle read and write a file
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class FileService {
  // todo-02-file-02: get a file path first
  Future<String> getFilePath(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    final prefixDirectory = directory.path;
    final absolutePath = p.join(prefixDirectory, filename);
    return absolutePath;
  }

  // todo-02-file-03: write a file
  Future<void> writeFile(String filename, String contents) async {
    try {
      final filePath = await getFilePath(filename);
      final file = File(filePath);
      await file.writeAsString(contents);
    } catch (e) {
      throw Exception("The file failed to be created");
    }
  }

  // todo-02-file-04: read a file
  Future<String> readFile(String filename) async {
    try {
      final filePath = await getFilePath(filename);
      final file = File(filePath);

      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      throw Exception("The file failed to be read");
    }
  }

  // todo-02-file-05: read all txt file
  Future<List<String>> getFilesInDirectory() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final files = directory
          .listSync()
          .toList()
          .where((file) => file.path.endsWith('.txt'));
      final filesName = files.map((file) => p.split(file.path).last).toList();
      return filesName;
    } catch (e) {
      throw Exception("Cannot read the entire file");
    }
  }
}

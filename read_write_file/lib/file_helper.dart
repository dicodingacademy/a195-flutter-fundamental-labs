import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHelper {
  static Future<String> getFilePath(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    final prefix = directory.path;
    final absolutePath = '$prefix/$filename.txt';
    return absolutePath;
  }

  static Future<File> writeFile(String path, String content) async {
    final file = File(path);

    // Write the file.
    print('Saved to $path');
    return file.writeAsString('$content');
  }

  static Future<String> readFile(String filePath) async {
    try {
      final file = File(filePath);

      // Read the file.
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0.
      print(e);
      return '';
    }
  }
}

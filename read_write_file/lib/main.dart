import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:read_write_file/file_dialog.dart';
import 'package:read_write_file/file_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _createNewFile() {
    _titleController.clear();
    _contentController.clear();
  }

  void _openFile(String filePath) async {
    final content = await FileHelper.readFile(filePath);
    _contentController.text = content;
  }

  void _getFilesInDirectory(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();

    final dir = Directory(directory.path);
    final files =
        dir.listSync().toList().where((file) => file.path.contains('txt'));

    final FileSystemEntity openFile = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => FileDialog(
          files: files.toList(),
        ),
        fullscreenDialog: true,
      ),
    );

    if (openFile != null) {
      _openFile(openFile.path);
      _titleController.text = split(openFile.path).last.split('.').first;
    }
  }

  bool get isValid => _titleController.text.isNotEmpty;

  void _saveFile(BuildContext context) async {
    if (isValid) {
      final filePath = await FileHelper.getFilePath(_titleController.text);
      FileHelper.writeFile(filePath, _contentController.text);
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('File Saved'),
            actions: [
              CupertinoDialogAction(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              'File Not Created',
              style: TextStyle(color: CupertinoColors.systemRed),
            ),
            content: Text('File name must not be empty!'),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('My Read Write File'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CupertinoButton(
                    child: Text('New File'),
                    onPressed: _createNewFile,
                  ),
                ),
                Expanded(
                  child: CupertinoButton(
                    child: Text('Open File'),
                    onPressed: () => _getFilesInDirectory(context),
                  ),
                ),
                Expanded(
                  child: CupertinoButton(
                    child: Text('Save File'),
                    onPressed: () {
                      _saveFile(context);
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: CupertinoTextField(
                      placeholder: 'File Name',
                      controller: _titleController,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: CupertinoTextField(
                  placeholder: 'Write your notes here...',
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _contentController,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

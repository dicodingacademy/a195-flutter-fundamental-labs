import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_write_file/file_dialog.dart';
import 'package:read_write_file/file_helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _createNewFile() {
    _titleController.clear();
    _contentController.clear();
  }

  void _openFile(String filePath) async {
    final content = await FileHelper.readFile(filePath);
    _contentController.text = content;
    _titleController.text = split(filePath).last.split('.').first;
  }

  void _getFilesInDirectory(BuildContext context) async {
    final navigator = Navigator.of(context);
    final directory = await getApplicationDocumentsDirectory();

    final dir = Directory(directory.path);
    final files =
        dir.listSync().toList().where((file) => file.path.contains('txt'));

    final FileSystemEntity? selectedFile = await navigator.push(
      CupertinoPageRoute(
        builder: (context) => FileDialog(
          files: files.toList(),
        ),
        fullscreenDialog: true,
      ),
    );

    if (selectedFile != null) {
      _openFile(selectedFile.path);
    }
  }

  bool get _isValid => _titleController.text.isNotEmpty;

  void _saveFile(BuildContext context) async {
    if (_isValid) {
      final filePath = await FileHelper.getFilePath(_titleController.text);
      FileHelper.writeFile(filePath, _contentController.text);
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('File Saved'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Ok'),
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
            title: const Text(
              'File Not Created',
              style: TextStyle(color: CupertinoColors.systemRed),
            ),
            content: const Text('File name must not be empty!'),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('Ok'),
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
      navigationBar: const CupertinoNavigationBar(
        middle: Text('My Read Write File'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CupertinoButton(
                    onPressed: _createNewFile,
                    child: const Text('New File'),
                  ),
                ),
                Expanded(
                  child: CupertinoButton(
                    child: const Text('Open File'),
                    onPressed: () => _getFilesInDirectory(context),
                  ),
                ),
                Expanded(
                  child: CupertinoButton(
                    child: const Text('Save File'),
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

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}

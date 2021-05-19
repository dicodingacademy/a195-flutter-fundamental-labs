import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FileDialog extends StatelessWidget {
  final List<FileSystemEntity> files;

  FileDialog({required this.files});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Choose your file'),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final file = files[index];
          return Material(
            child: ListTile(
              title: Text(split(file.path).last),
              onTap: () {
                Navigator.pop(context, file);
              },
            ),
          );
        },
        itemCount: files.length,
      ),
    );
  }
}

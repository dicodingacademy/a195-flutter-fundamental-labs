import 'package:dicodingacademy/ui/done_module_list.dart';
import 'package:dicodingacademy/ui/module_list.dart';
import 'package:flutter/material.dart';

class ModulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memulai Pemrograman Dengan Dart'),
        actions: <Widget>[
          IconButton(
            key: Key('done_page_button'),
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoneModuleList(),
                ),
              );
            },
          ),
        ],
      ),
      body: ModuleList(),
    );
  }
}

import 'package:dicodingacademy/ui/done_module_list.dart';
import 'package:dicodingacademy/ui/module_list.dart';
import 'package:flutter/material.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memulai Pemrograman Dengan Dart'),
        actions: <Widget>[
          IconButton(
            key: const Key('done_page_button'),
            icon: const Icon(Icons.done),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoneModuleList(),
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

import 'package:dicodingacademy/ui/done_module_list.dart';
import 'package:dicodingacademy/ui/module_list.dart';
import 'package:flutter/material.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  final List<String> doneModuleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memulai Pemrograman Dengan Dart'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DoneModuleList(doneModuleList: doneModuleList),
                ),
              );
            },
          ),
        ],
      ),
      body: ModuleList(doneModuleList: doneModuleList),
    );
  }
}

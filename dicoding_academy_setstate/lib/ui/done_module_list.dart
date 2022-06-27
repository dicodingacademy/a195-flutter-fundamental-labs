import 'package:flutter/material.dart';

class DoneModuleList extends StatelessWidget {
  final List<String> doneModuleList;
  const DoneModuleList({Key? key, required this.doneModuleList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Module List'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doneModuleList[index]),
          );
        },
        itemCount: doneModuleList.length,
      ),
    );
  }
}

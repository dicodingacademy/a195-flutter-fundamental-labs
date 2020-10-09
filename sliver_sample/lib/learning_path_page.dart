import 'package:flutter/material.dart';
import 'package:sliver_sample/learning_path_list.dart';

class LearningPathPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dicoding Learning Paths'),
      ),
      body: LearningPathList(),
    );
  }
}

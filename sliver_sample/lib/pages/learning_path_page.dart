import 'package:flutter/material.dart';
import 'package:sliver_sample/data/academy.dart';
import 'package:sliver_sample/widgets/sliver_app_bar_delegate.dart';

class LearningPathPage extends StatelessWidget {
  SliverPersistentHeader _header(String text) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 60,
        maxHeight: 150,
        child: Container(
          color: Colors.lightBlue,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTile(Academy academy) {
    return ListTile(
      title: Text(academy.title),
      subtitle: Text(academy.description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dicoding Learning Paths'),
      ),
      body: CustomScrollView(
        slivers: [
          _header('Android Developer'),
          SliverList(
            delegate: SliverChildListDelegate(
              androidPaths.map(_buildTile).toList(),
            ),
          ),
          _header('iOS Developer'),
          SliverList(
            delegate: SliverChildListDelegate(
              iosPaths.map(_buildTile).toList(),
            ),
          ),
          _header('Multi-Platform App Developer'),
          SliverGrid.count(
            crossAxisCount: 2,
            children: flutterPaths.map(_buildTile).toList(),
          ),
          _header('Front-End Web Developer'),
          SliverGrid.count(
            crossAxisCount: 2,
            children: webPaths.map(_buildTile).toList(),
          )
        ],
      ),
    );
  }
}

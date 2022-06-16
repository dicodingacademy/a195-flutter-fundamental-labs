import 'package:flutter/material.dart';
import 'package:learning_paths/academy.dart';

class LearningPathPage extends StatelessWidget {
  const LearningPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicoding Learning Paths'),
      ),
      body: const LearningPathList(),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class LearningPathList extends StatelessWidget {
  const LearningPathList({Key? key}) : super(key: key);

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
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTile(Academy academy) {
    return ListTile(
      title: Text(academy.title),
      subtitle: Text(
        academy.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      ),
      isThreeLine: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        ),
      ],
    );
  }
}

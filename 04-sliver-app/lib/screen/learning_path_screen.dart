// todo-03: create a screen for LearningPathScreen
import 'package:flutter/material.dart';
import 'package:sliver_app/model/dicoding_classes.dart';
import 'package:sliver_app/utils/sliver_header_delegate.dart';
import 'package:sliver_app/widget/listtile_item.dart';

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo-05: set CustomScrollView for the Scaffold body
      body: CustomScrollView(
        slivers: [
          // todo-06: add SliverAppBar as a toolbar/appbar
          const SliverAppBar.medium(
            title: Text("Dicoding Learning Path"),
          ),
          // todo-15: put a new header in our sliver list
          _header(context, "Android Developer"),
          // todo-16: add SliverList for Multi-platform App classes
          SliverList(
            // todo-18: define a builder delegate for SliverList
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTileItem(
                dicodingClasses: flutterPaths[index],
              ),
              childCount: flutterPaths.length,
            ),
          ),
          // todo-19: put another header in our sliver list
          _header(context, "iOS Developer"),
          // todo-20: define a common SliverGrid
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTileItem(
                dicodingClasses: iosPaths[index],
              ),
              childCount: iosPaths.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
          // todo-21: put another header in our sliver list
          _header(context, "Multi-platform App Developer"),
          // todo-22: add SliverList.builder for Android classes
          SliverList.builder(
            itemCount: androidPath.length,
            // todo-23: put an item for Android learning path
            itemBuilder: (context, index) => ListTileItem(
              dicodingClasses: androidPath[index],
            ),
          ),
          // todo-24: put another header in our sliver list
          _header(context, "Front-End Web Developer"),
          // todo-25: add SliverGrid.count for web classes
          SliverGrid.count(
            crossAxisCount: 2,
            children: webPaths
                .map((webClass) => ListTileItem(
                      dicodingClasses: webClass,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  // todo-07: create a method that return SliverPersistentHeader
  // then create empty SliverPersistentHeader that containt a text
  // and context from parameter
  // before that, we need to define delegate first
  SliverPersistentHeader _header(
    BuildContext context,
    String text,
  ) {
    return SliverPersistentHeader(
      // todo-14: define a delegate here and make it pinned
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: 60,
        maxHeight: 150,
        child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}

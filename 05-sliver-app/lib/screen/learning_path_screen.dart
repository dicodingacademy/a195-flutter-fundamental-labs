// todo-01-init-03: create a screen for LearningPathScreen
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
      // todo-01-init-05: set CustomScrollView for the Scaffold body
      body: CustomScrollView(
        slivers: [
          // todo-03-sliver-02: add SliverAppBar as a toolbar/appbar
          const SliverAppBar.medium(
            title: Text("Dicoding Learning Path"),
          ),
          // todo-03-sliver-03: put a new header in our sliver list
          // and add SliverList for Multi-platform App classes
          _header(context, "Multi-platform Developer"),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTileItem(
                dicodingClasses: multiplatformPath[index],
              ),
              childCount: multiplatformPath.length,
            ),
          ),
          // todo-03-sliver-04: put another header in our sliver list
          // and define a common SliverGrid
          _header(context, "iOS Developer"),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTileItem(
                dicodingClasses: iosPath[index],
              ),
              childCount: iosPath.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
          // todo-03-sliver-05: put another header in our sliver list
          // and add SliverList.builder for Android classes
          _header(context, "Android Developer"),
          SliverList.builder(
            itemCount: androidPath.length,
            itemBuilder: (context, index) => ListTileItem(
              dicodingClasses: androidPath[index],
            ),
          ),
          // todo-03-sliver-06: put another header in our sliver list
          // and add SliverGrid.count for web classes
          _header(context, "Front-End Web Developer"),
          SliverGrid.count(
            crossAxisCount: 2,
            children: webPath
                .map((webClass) => ListTileItem(
                      dicodingClasses: webClass,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  // todo-02-header-01: create a method that return SliverPersistentHeader
  // then create empty SliverPersistentHeader that containt a text
  // and context from parameter
  // before that, we need to define delegate first
  SliverPersistentHeader _header(
    BuildContext context,
    String text,
  ) {
    return SliverPersistentHeader(
      // todo-02-header-08: define a delegate here and make it pinned
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

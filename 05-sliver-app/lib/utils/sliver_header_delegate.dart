// todo-02-header-02: create a SliverPersistentHeaderDelegate first
import 'dart:math';

import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  // todo-02-header-03: implement some method that provided
  // todo-02-header-04: create a constructor which has minHeight, maxHeight, and child parameter
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // todo-02-header-05: display a widget from child parameter
    return child;
  }

  @override
  // todo-02-header-06: define maxHeight and minHeight from constructor parameter
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverHeaderDelegate oldDelegate) {
    // todo-02-header-07: define a boolean value so the widget will rebuild when the value is true
    // if variabel is error, that because the parameter. That should be the name of class
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

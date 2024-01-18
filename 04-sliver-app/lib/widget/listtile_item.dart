import 'package:flutter/material.dart';
import 'package:sliver_app/model/dicoding_classes.dart';

// todo-17: create a ListTileItem for reusable widget
class ListTileItem extends StatelessWidget {
  final DicodingClasses dicodingClasses;

  const ListTileItem({
    super.key,
    required this.dicodingClasses,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(dicodingClasses.title),
      subtitle: Text(
        dicodingClasses.description,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      isThreeLine: true,
      onTap: () {},
    );
  }
}

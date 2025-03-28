// todo-02-tab-01: create a FeedScreen and SearchScreen for the child of tab screen
import 'package:cupertino_app/static/my_route.dart';
import 'package:flutter/cupertino.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Feeds Screen"),
      ),
      child: Center(
        // todo-03-dialog-05: wrap Text widget with Column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Feeds Screen",
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            // todo-03-dialog-06: add button to open the dialog
            const SizedBox.square(dimension: 8),
            CupertinoButton.filled(
              child: const Text("Select Category"),
              onPressed: () {
                // todo-03-dialog-09: call the dialog from this callback
                _openDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // todo-03-dialog-07: create a function to open the dialog
  void _openDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        // todo-03-dialog-08: set CupertinoActionSheet to display it in modal
        return CupertinoActionSheet(
          title: const Text('Select Categories'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.category.name,
                    arguments: 'Technology');
              },
              child: const Text('Technology'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.category.name,
                    arguments: 'Business');
              },
              child: const Text('Business'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.category.name,
                    arguments: 'Sport');
              },
              child: const Text('Sport'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Close'),
            onPressed: () => Navigator.pop(context),
          ),
        );
      },
    );
  }
}

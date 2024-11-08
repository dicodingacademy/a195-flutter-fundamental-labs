// todo-01-app-03: create a Placeholder for SettingScreen
import 'package:flutter/cupertino.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // todo-01-app-04: replace Placeholder with CupertinoPageScaffold and add the Text in the middle
    return CupertinoPageScaffold(
      // todo-01-app-05: add CupertinoNavigationBar as toolbar or appbar
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Setting Screen"),
      ),
      child: Center(
        // todo-04-alert-01: change Text widget into Button
        child: CupertinoButton.filled(
          child: const Text("Logout"),
          onPressed: () {
            // todo-04-alert-04: call the alert method
            _openAlert(context);
          },
        ),
      ),
    );
  }

  // todo-04-alert-02: create a function to open the alert
  void _openAlert(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        // todo-04-alert-03: define the alert
        return CupertinoAlertDialog(
          title: const Text('Are you sure to logout?'),
          actions: [
            CupertinoDialogAction(
              child: const Text('No'),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: const Text('Yes'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_app/models/setting.dart';
import 'package:shared_preferences_app/providers/notification_state_provider.dart';
import 'package:shared_preferences_app/providers/shared_preferences_provider.dart';
import 'package:shared_preferences_app/utils/notification_state.dart';
import 'package:shared_preferences_app/utils/page_size_number.dart';
import 'package:shared_preferences_app/widgets/maximum_page_size_field.dart';
import 'package:shared_preferences_app/widgets/notification_field.dart';
import 'package:shared_preferences_app/widgets/save_button.dart';
import 'package:shared_preferences_app/widgets/signature_field.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    super.key,
  });

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final maximumPageSizeController = TextEditingController();
  final signatureController = TextEditingController();

  @override
  void dispose() {
    maximumPageSizeController.dispose();
    signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Setting Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const NotificationField(),
              MaximumPageSizeField(
                controller: maximumPageSizeController,
              ),
              SignatureField(
                controller: signatureController,
              ),
              SaveButton(
                onPressed: () => saveAction(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveAction() async {
    // todo-03-action-01: get all data from controller
    final notificationState =
        context.read<NotificationStateProvider>().notificationState;
    final isNotificationEnable = notificationState.isEnable;
    final maximumPageSize =
        int.tryParse(maximumPageSizeController.text) ?? defaultPageSizeNumbers;
    final signature = signatureController.text;
    final Setting setting = Setting(
      notificationEnable: isNotificationEnable,
      pageNumber: maximumPageSize,
      signature: signature,
    );

    // todo-03-action-02: save value to shared preferences
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
    await sharedPreferencesProvider.saveSettingValue(setting);

    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(sharedPreferencesProvider.message),
    ));
  }

  @override
  void initState() {
    super.initState();

    // todo-03-action-03: load value from shared preferences
    final notificationStateProvider = context.read<NotificationStateProvider>();
    final sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
    Future.microtask(() async {
      sharedPreferencesProvider.getSettingValue();
      final setting = sharedPreferencesProvider.setting;

      // todo-03-action-04: setup the value to the UI
      if (setting != null) {
        maximumPageSizeController.text = setting.pageNumber.toString();
        signatureController.text = setting.signature;
        notificationStateProvider.notificationState =
            setting.notificationEnable.isEnable;
      }
    });
  }
}

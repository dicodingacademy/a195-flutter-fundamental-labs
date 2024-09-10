import 'package:chatting_app/provider/shared_preference_provider.dart';
import 'package:chatting_app/static/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _contentController = TextEditingController();
  final _padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Room'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Logout',
            onPressed: () => _tapToSignOut(),
          )
        ],
      ),
      body: Padding(
        padding: _padding,
        child: Column(
          children: [
            const Expanded(
              child: Placeholder(),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _contentController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: _padding,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                DecoratedBox(
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    color: Theme.of(context).colorScheme.onPrimary,
                    onPressed: () => _sendMessage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _tapToSignOut() async {
    final sharedPreferenceProvider = context.read<SharedPreferenceProvider>();
    await sharedPreferenceProvider.logout();

    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        ScreenRoute.login.name,
      );
    }
  }

  void _sendMessage() async {}
}

import 'package:chatting_app/model/chat.dart';
import 'package:chatting_app/model/profile.dart';
import 'package:chatting_app/provider/firebase_auth_provider.dart';
import 'package:chatting_app/services/firebase_firestore_service.dart';
import 'package:chatting_app/static/firebase_auth_status.dart';
import 'package:chatting_app/static/screen_route.dart';
import 'package:chatting_app/widgets/message_bubble_widget.dart';
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
  // todo-03-action-02: set the profile data to compare with chat data
  late final Profile? profile;

  @override
  void initState() {
    super.initState();
    // todo-03-action-02: set the profile data to compare with chat data
    profile = context.read<FirebaseAuthProvider>().profile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Room'),
        actions: [
          Consumer<FirebaseAuthProvider>(
            builder: (context, value, child) {
              return switch (value.authStatus) {
                FirebaseAuthStatus.signingOut => const Center(
                    child: CircularProgressIndicator(),
                  ),
                _ => IconButton(
                    icon: const Icon(Icons.close),
                    tooltip: 'Logout',
                    onPressed: () => _tapToSignOut(),
                  ),
              };
            },
          ),
        ],
      ),
      body: Padding(
        padding: _padding,
        child: Column(
          children: [
            // todo-03-action-03: change the Placeholder into StreamBuilder
            Expanded(
              child: StreamProvider<List<Chat>>(
                create: (context) =>
                    context.read<FirebaseFirestoreService>().getMessage(),
                initialData: const <Chat>[],
                catchError: (context, error) {
                  debugPrint("error: $error");
                  return [];
                },
                builder: (context, child) {
                  // todo-03-action-04: show the UI when chat is empty or not
                  final chats = Provider.of<List<Chat>>(context);
                  return chats.isEmpty
                      ? const Center(
                          child: Text("Empty List"),
                        )
                      : ListView.builder(
                          reverse: true,
                          itemCount: chats.length,
                          itemBuilder: (context, index) {
                            final chat = chats[index];
                            return MessageBubble(
                              content: chat.text,
                              sender: chat.emailSender,
                              isMyChat: chat.emailSender == profile?.email,
                            );
                          },
                        );
                },
              ),
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
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await firebaseAuthProvider.signOutUser().then((value) {
      navigator.pushReplacementNamed(
        ScreenRoute.login.name,
      );
    }).whenComplete(() {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(firebaseAuthProvider.message ?? ""),
      ));
    });
  }

  void _sendMessage() async {
    // todo-03-action-05: give the action whtn button is clicked
    final service = context.read<FirebaseFirestoreService>();
    final email = profile!.email!;
    final content = _contentController.text;

    if (content.isNotEmpty) {
      await service.sendMessage(text: content, emailSender: email);
      _contentController.clear();
    }
  }
}

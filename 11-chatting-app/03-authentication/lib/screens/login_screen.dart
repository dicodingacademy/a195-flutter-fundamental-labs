import 'package:chatting_app/provider/firebase_auth_provider.dart';
import 'package:chatting_app/static/firebase_auth_status.dart';
import 'package:chatting_app/static/screen_route.dart';
import 'package:chatting_app/widgets/textfield_obsecure_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'chatting-app',
              child: Text(
                'Chatting App',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 8.0),
            TextFieldObscure(
              controller: _passwordController,
              hintText: 'Password',
            ),
            const SizedBox(height: 24.0),
            // todo-03-action-04: consume the state when it's loading
            Consumer<FirebaseAuthProvider>(
              builder: (context, value, child) {
                return switch (value.authStatus) {
                  FirebaseAuthStatus.authenticating => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  _ => FilledButton(
                      onPressed: () => _tapToLogin(),
                      child: const Text('Login'),
                    ),
                };
              },
            ),
            const SizedBox.square(dimension: 16),
            GestureDetector(
              child: const Text(
                'Does not have an account yet? Register here',
                textAlign: TextAlign.center,
              ),
              onTap: () => _goToRegister(),
            ),
          ],
        ),
      ),
    );
  }

  void _tapToLogin() async {
    // todo-03-action-03: sign in the account
    final email = _emailController.text;
    final password = _passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
      final navigator = Navigator.of(context);
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      await firebaseAuthProvider.signInUser(email, password);
      switch (firebaseAuthProvider.authStatus) {
        case FirebaseAuthStatus.authenticated:
          navigator.pushReplacementNamed(
            ScreenRoute.chat.name,
          );
        case _:
          scaffoldMessenger.showSnackBar(SnackBar(
            content: Text(firebaseAuthProvider.message ?? ""),
          ));
      }
    } else {
      const message = "Fill the email and password correctly";

      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text(message),
      ));
    }
  }

  void _goToRegister() async {
    Navigator.pushNamed(
      context,
      ScreenRoute.register.name,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

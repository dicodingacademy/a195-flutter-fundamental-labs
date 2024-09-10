import 'package:chatting_app/provider/shared_preference_provider.dart';
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
            FilledButton(
              onPressed: () => _tapToLogin(),
              child: const Text('Login'),
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

  @override
  void initState() {
    super.initState();

    final navigator = Navigator.of(context);
    final isLogin = context.read<SharedPreferenceProvider>().isLogin;

    Future.microtask(() {
      if (isLogin) {
        navigator.pushReplacementNamed(
          ScreenRoute.chat.name,
        );
      }
    });
  }

  void _tapToLogin() async {
    final sharedPreferenceProvider = context.read<SharedPreferenceProvider>();
    await sharedPreferenceProvider.login();

    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        ScreenRoute.chat.name,
      );
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

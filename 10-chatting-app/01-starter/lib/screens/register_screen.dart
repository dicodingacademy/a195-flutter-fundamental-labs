import 'package:chatting_app/widgets/textfield_obsecure_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            Text(
              'Create your account',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
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
              onPressed: () => _tapToRegister(),
              child: const Text('Register'),
            ),
            const SizedBox.square(dimension: 16),
            GestureDetector(
              child: const Text(
                'Already have an account? Login',
                textAlign: TextAlign.center,
              ),
              onTap: () => _goToLogin(),
            ),
          ],
        ),
      ),
    );
  }

  void _tapToRegister() async {}

  void _goToLogin() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

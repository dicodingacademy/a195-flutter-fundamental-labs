import 'package:chatting_app/provider/obscure_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldObscure extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;

  const TextFieldObscure({
    super.key,
    required this.controller,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ObscureProvider(),
      child: Consumer<ObscureProvider>(
        builder: (context, value, child) {
          final obscureText = value.obscureText;

          return TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon:
                    Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  value.obscureText = !obscureText;
                },
              ),
              hintText: hintText ?? 'Password',
            ),
          );
        },
      ),
    );
  }
}

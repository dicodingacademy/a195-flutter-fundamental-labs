import 'package:flutter/material.dart';
import 'package:shared_preferences_app/widgets/title_form.dart';

class SignatureField extends StatelessWidget {
  final TextEditingController controller;

  const SignatureField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleForm("Signature:"),
          const SizedBox.square(dimension: 4),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your signature.",
            ),
            minLines: 3,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}

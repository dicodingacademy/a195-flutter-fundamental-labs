import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_app/model/profile.dart';
import 'package:shared_preferences_app/provider/shared_preferences_provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({
    super.key,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _phoneNumberController =
      TextEditingController();
  bool _isMarried = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Form Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Input your name",
                  label: Text("Name"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox.square(dimension: 16),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Input your email",
                  label: Text("Email"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox.square(dimension: 16),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Input your phone number",
                  label: Text("Phone Number"),
                  prefixText: "+62",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox.square(dimension: 16),
              SwitchListTile.adaptive(
                title: const Text("Are you married?"),
                value: _isMarried,
                onChanged: (value) {
                  setState(() {
                    _isMarried = value;
                  });
                },
              ),
              const SizedBox.square(dimension: 32),
              FilledButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Save"),
                onPressed: () async {
                  // todo-action-01: save all value to shared preferences
                  final profile = Profile(
                    name: _nameController.text,
                    email: _emailController.text,
                    phoneNumber: _phoneNumberController.text,
                    maritalStatus: _isMarried,
                  );
                  await context
                      .read<SharedPreferencesProvider>()
                      .saveProfileValue(profile);

                  // todo-action-02: wrap the Navigator using if mounted
                  if (mounted) {
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

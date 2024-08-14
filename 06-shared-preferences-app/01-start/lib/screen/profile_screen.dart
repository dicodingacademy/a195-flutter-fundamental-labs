import 'package:flutter/material.dart';
import 'package:shared_preferences_app/screen/form_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _phoneNumberController =
      TextEditingController();
  late final TextEditingController _marriedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Profile Screen'),
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
                readOnly: true,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
              ),
              const SizedBox.square(dimension: 16),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                readOnly: true,
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
              ),
              const SizedBox.square(dimension: 16),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                readOnly: true,
                decoration: const InputDecoration(
                  label: Text("Phone Number"),
                  prefixText: "+62",
                ),
              ),
              const SizedBox.square(dimension: 16),
              TextField(
                controller: _marriedController,
                keyboardType: TextInputType.text,
                readOnly: true,
                decoration: const InputDecoration(
                  label: Text("Marital Status"),
                ),
              ),
              const SizedBox.square(dimension: 32),
              FilledButton.icon(
                icon: const Icon(Icons.edit),
                label: const Text("Edit"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FormScreen(),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

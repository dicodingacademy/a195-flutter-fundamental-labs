import 'package:flutter/material.dart';
import 'package:sqlite_app/model/profile.dart';
import 'package:sqlite_app/screen/form_screen.dart';
import 'package:sqlite_app/widgets/profile_card_widget.dart';

class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({
    super.key,
  });

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
            children: [
              ProfileCardWidget(
                profile: Profile(
                  name: "Ilham",
                  email: "ilham@dicoding.com",
                  phoneNumber: "81234567890",
                  maritalStatus: true,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

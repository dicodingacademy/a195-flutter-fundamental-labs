import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_app/provider/shared_preferences_provider.dart';
import 'package:shared_preferences_app/screen/form_screen.dart';
import 'package:shared_preferences_app/static/route_observer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

// todo-observer-03: add RouteAware to this state
class _ProfileScreenState extends State<ProfileScreen> with RouteAware {
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _phoneNumberController =
      TextEditingController();
  late final TextEditingController _marriedController = TextEditingController();

  // todo-action-06: call the function in this method
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loadProfileValue();
    // todo-observer-04: subscribe this widget to observe the profile route
    observer.subscribe(this, ModalRoute.of(context)!);
  }

  // todo-observer-05: dont forget to unsubscribe when this widget is no longer visible
  @override
  void dispose() {
    observer.unsubscribe(this);
    super.dispose();
  }

  // todo-observer-06: observe the widget when top route has been popped off
  @override
  void didPopNext() {
    _loadProfileValue();
    super.didPopNext();
  }

  // todo-action-04: add a function to get a profile value from shared preference
  void _loadProfileValue() async {
    Future.microtask(() {
      final sharedPreferencesProvider =
          context.read<SharedPreferencesProvider>();
      sharedPreferencesProvider.getProfileValue();

      // todo-action-05: set UI based on the profile value
      final profile = sharedPreferencesProvider.profile;
      _nameController.text = profile?.name ?? "";
      _emailController.text = profile?.email ?? "";
      _phoneNumberController.text = profile?.phoneNumber ?? "";
      _marriedController.text = profile?.maritalStatus == null
          ? ""
          : profile!.maritalStatus!
              ? "Married"
              : "Single";
      // (profile?.maritalStatus ?? false) ? "Single" : "Married";
    });
  }


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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_app/model/profile.dart';
import 'package:sqlite_app/provider/local_database_provider.dart';
import 'package:sqlite_app/screen/form_screen.dart';
import 'package:sqlite_app/static/action_page_enum.dart';
import 'package:sqlite_app/widgets/profile_card_widget.dart';

// todo-action-01: make it stateful widget
class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({
    super.key,
  });

  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  // todo-action-02: load all profile data into list
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.microtask(() {
      context.read<LocalDatabaseProvider>().loadAllProfileValue();
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileCardWidget(
                profile: Profile(
                  name: "Achmad Ilham",
                  email: "achmadilham@gmail.com",
                  phoneNumber: "81234567890",
                  maritalStatus: true,
                ),
              ),
              // todo-action-03: add a Consumer widget that handle a list
              Consumer<LocalDatabaseProvider>(
                builder: (context, value, child) {
                  // todo-action-04: define a widget based on profile list
                  if (value.profileList == null) {
                    return const SizedBox();
                  }

                  final profileList = value.profileList!;
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: profileList.length,
                    itemBuilder: (context, index) {
                      final profile = profileList[index];
                      return ProfileCardWidget(
                        profile: profile,
                        // todo-action-05: add callback to remove the item
                        onTapRemove: () async {
                          if (profile.id != null) {
                            final localDatabaseProvider =
                                context.read<LocalDatabaseProvider>();
                            await localDatabaseProvider
                                .removeProfileValueById(profile.id!);
                            await localDatabaseProvider.loadAllProfileValue();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("This item cannot be deleted")),
                            );
                          }
                        },
                        // todo-action-12: add callback to edit the item
                        onTapEdit: () {
                          if (profile.id != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormScreen(
                                        // todo-action-11: add action page to FAB navigation
                                        actionPageEnum: ActionPageEnum.edit,
                                        profile: profile,
                                      )),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("This item cannot be deleted")),
                            );
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FormScreen(
                      // todo-action-11: add action page to FAB navigation
                      actionPageEnum: ActionPageEnum.add,
                    )),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

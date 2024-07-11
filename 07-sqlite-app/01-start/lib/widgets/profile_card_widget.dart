import 'package:flutter/material.dart';
import 'package:sqlite_app/model/profile.dart';
import 'package:sqlite_app/widgets/profile_row_widget.dart';

class ProfileCardWidget extends StatelessWidget {
  final Profile profile;
  final Function? onTapEdit;
  final Function? onTapRemove;

  const ProfileCardWidget({
    super.key,
    required this.profile,
    this.onTapEdit,
    this.onTapRemove,
  });

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.titleMedium;
    final borderRadius = BorderRadius.circular(10);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      child: InkWell(
        onTap: () {},
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      profile.name,
                      style:
                          titleTextStyle?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox.square(dimension: 4),
                    ProfileRowWidget(
                      title: "Email",
                      subtitle: profile.email,
                    ),
                    const SizedBox.square(dimension: 4),
                    ProfileRowWidget(
                      title: "Phone Number",
                      subtitle: "+62${profile.phoneNumber}",
                    ),
                    const SizedBox.square(dimension: 4),
                    ProfileRowWidget(
                      title: "Marital Status ",
                      subtitle: profile.maritalStatus == null
                          ? ""
                          : profile.maritalStatus!
                              ? "Married"
                              : "Single",
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: onTapEdit != null ? () => onTapEdit!() : null,
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed:
                        onTapRemove != null ? () => onTapRemove!() : null,
                    icon: const Icon(Icons.delete),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

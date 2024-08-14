class Profile {
  final int? id;
  final String name;
  final String email;
  final String phoneNumber;
  final bool? maritalStatus;

  Profile({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.maritalStatus,
  });
}

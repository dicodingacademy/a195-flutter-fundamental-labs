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

  // todo-service-02: create factory constructor from map to object class and vice versa
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'maritalStatus': (maritalStatus == null)
          ? 0
          : maritalStatus!
              ? 1
              : 0,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        "id": int id,
        "name": String name,
        "email": String email,
        "phoneNumber": String phoneNumber,
        "maritalStatus": int maritalStatus,
      } =>
        Profile(
          id: id,
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          maritalStatus: maritalStatus == 1,
        ),
      _ => throw const FormatException('Failed to load profile data.'),
    };
  }
}

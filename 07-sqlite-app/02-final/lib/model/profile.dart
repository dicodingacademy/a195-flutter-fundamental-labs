class Profile {
  final int? id;
  final String name;
  final String email;
  final String phoneNumber;
  final bool maritalStatus;

  Profile({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.maritalStatus,
  });

  // todo-01-service-02: create factory constructor from map to object class and vice versa
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'maritalStatus': maritalStatus
              ? 1
              : 0,
    };
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      maritalStatus: json['maritalStatus'] as int == 1,
    );
  }
}

class Profile {
  final int userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String status;

  Profile({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.status,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson(Profile profile) {
    final Map<String, dynamic> data = {
      'userId': profile.userId,
      'firstName': profile.firstName,
      'lastName': profile.lastName,
      'email': profile.email,
      'phone': profile.phone,
      'status': profile.status,
    };
    return data;
  }
}

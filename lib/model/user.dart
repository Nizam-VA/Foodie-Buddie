class User {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String rePassword;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.rePassword,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      rePassword: json['rePassword'],
    );
  }
}

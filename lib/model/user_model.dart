import '../screens/auth/signup/view/signup_controller.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  String? password;
  String? gender;
  String? religion;
  String? community;
  String? livingIn;
  String? mobile;

  final String? createdAt;
  final String? updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.password,
    this.gender,
    this.religion,
    this.community,
    this.livingIn,
    this.mobile,
    this.createdAt,
    this.updatedAt,
  });

  /// Convert from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
      religion: json['religion'],
      community: json['community'],
      livingIn: json['livingIn'],
      mobile: json['mobile'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      if (password != null) 'password': password,
      if (gender != null) 'gender': gender,
      if (religion != null) 'religion': religion,
      if (community != null) 'community': community,
      if (livingIn != null) 'livingIn': livingIn,
      if (mobile != null) 'mobile': mobile,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    };
  }

  /// Optional: Create from SignupController
  // factory UserModel.fromController({required int id, required SignupController c}) {
  //   return UserModel(
  //     id: id,
  //     name: '${c.firstName.text.trim()} ${c.lastName.text.trim()}',
  //     email: c.email.text.trim(),
  //     password: c.password.text,
  //     gender: c.gender,
  //     religion: c.religion,
  //     community: c.community,
  //     livingIn: c.livingIn,
  //     mobile: c.mobile.text.trim(),
  //   );
  // }
}

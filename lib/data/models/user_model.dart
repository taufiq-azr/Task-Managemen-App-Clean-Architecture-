import 'package:fullstack_taskmanagement/features/Auth/domain/entities/users.dart';

class UserModel extends Users {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

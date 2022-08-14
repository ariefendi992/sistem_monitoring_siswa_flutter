import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? username, email, group, password;
  final String? namaDepan, namaBelakang;

  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.group,
    required this.password,
    required this.namaDepan,
    required this.namaBelakang,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      group: json['group'],
      namaDepan: json['nama_depan'],
      namaBelakang: json['nama_belakang'],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'group': group,
        'email': email,
      };

  @override
  List<Object?> get props => [id, username, email, group, password];
}

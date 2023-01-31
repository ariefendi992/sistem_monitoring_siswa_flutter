import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? username, group, password;
  final String? namaDepan, namaBelakang, kelas;

  const UserModel(
      {required this.id,
      required this.username,
      required this.group,
      required this.password,
      required this.namaDepan,
      required this.namaBelakang,
      required this.kelas});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        group: json['group'],
        namaDepan: json['first_name'],
        namaBelakang: json['last_name'],
        kelas: json['kelas']);
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'group': group,
        'kelas': kelas,
      };

  @override
  List<Object?> get props => [id, username, kelas, group, password];
}

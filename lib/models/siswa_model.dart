import 'package:equatable/equatable.dart';

class SiswaModel extends Equatable {
  final int? userID;
  final String? username;
  final String? email;
  final String? group;
  final String? nisn;
  final String? jenisKelamin;
  final String? namaDepan, namaBelakang;
  final String? agama, alamat;
  final String? namaAyah, namaIbu;

  const SiswaModel({
    required this.userID,
    required this.username,
    required this.email,
    required this.group,
    required this.namaDepan,
    required this.namaBelakang,
    required this.nisn,
    required this.jenisKelamin,
    required this.namaAyah,
    required this.namaIbu,
    required this.agama,
    required this.alamat,
  });

  factory SiswaModel.fromJson(Map<String, dynamic> json) {
    return SiswaModel(
      userID: json['user_id'],
      username: json['username'],
      email: json['email'],
      group: json['group'],
      namaDepan: json['nama_depan'],
      namaBelakang: json['nama_belakang'],
      nisn: json['nisn'],
      jenisKelamin: json['jenis_kelamin'],
      namaAyah: json['nama_ayah'],
      namaIbu: json['nama_ibu'],
      agama: json['agama'],
      alamat: json['alamat'],
    );
  }

  @override
  List<Object?> get props => [
        userID,
        username,
        email,
        group,
        nisn,
        namaDepan,
        namaBelakang,
        nisn,
        namaAyah,
        namaIbu,
        agama,
        alamat
      ];
}

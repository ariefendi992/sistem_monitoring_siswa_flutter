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
  final String? profilPicture;
  final String? kelas;
  final String? qrCode;

  const SiswaModel({
    required this.userID,
    required this.username,
    required this.email,
    required this.group,
    required this.namaDepan,
    required this.namaBelakang,
    required this.nisn,
    required this.jenisKelamin,
    required this.agama,
    required this.alamat,
    required this.profilPicture,
    required this.kelas,
    required this.qrCode,
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
      agama: json['agama'],
      alamat: json['alamat'],
      profilPicture: json['foto'],
      kelas: json['kelas'],
      qrCode: json['qr_code'],
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
        agama,
        alamat
      ];
}

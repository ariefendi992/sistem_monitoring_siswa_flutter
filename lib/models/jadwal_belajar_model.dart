import 'package:equatable/equatable.dart';

class JadwalBelajarModel extends Equatable {
  final int? id;
  final String? mapel, mulai, selesai;
  final String? kelas, namaGuru, hari;

  const JadwalBelajarModel({
    required this.id,
    required this.mapel,
    required this.mulai,
    required this.selesai,
    required this.kelas,
    required this.namaGuru,
    required this.hari,
  });

  factory JadwalBelajarModel.fromJson(Map<String, dynamic> json) {
    return JadwalBelajarModel(
        id: json['id'],
        mapel: json['mapel'],
        mulai: json['jam_mulai'],
        selesai: json['jam_selesai'],
        kelas: json['kelas'],
        namaGuru: json['nama_guru'],
        hari: json['hari']);
  }

  @override
  List<Object?> get props => [id, mapel, mulai, selesai, kelas, namaGuru, hari];
}

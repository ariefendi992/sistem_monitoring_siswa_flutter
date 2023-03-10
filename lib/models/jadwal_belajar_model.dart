import 'package:equatable/equatable.dart';

class JadwalBelajarModel extends Equatable {
  final int? id;
  final String? mapel, mulai, selesai, hari, jamKe;

  const JadwalBelajarModel({
    required this.id,
    required this.mapel,
    required this.mulai,
    required this.selesai,
    required this.hari,
    required this.jamKe,
  });

  factory JadwalBelajarModel.fromJson(Map<String, dynamic> json) {
    return JadwalBelajarModel(
      id: json['id'],
      hari: json['hari'],
      mapel: json['mapel'],
      mulai: json['jamMulai'],
      selesai: json['jamSelesai'],
      jamKe: json['jamKe'],
    );
  }

  @override
  List<Object?> get props => [id, mapel, mulai, selesai, jamKe, hari];
}

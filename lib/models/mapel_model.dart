import 'package:equatable/equatable.dart';

class MapelModel extends Equatable {
  final int? id;
  final String? mapel, guruMapel;

  const MapelModel({
    required this.id,
    required this.mapel,
    required this.guruMapel,
  });

  factory MapelModel.fromJson(Map<String, dynamic> json) {
    return MapelModel(
      id: json['id'],
      mapel: json['mapel'],
      guruMapel: json['nama_guru'],
    );
  }

  @override
  List<Object?> get props => [id, mapel, guruMapel];
}

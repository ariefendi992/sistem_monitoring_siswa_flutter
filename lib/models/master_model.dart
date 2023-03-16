import 'package:equatable/equatable.dart ';

class HariModel extends Equatable {
  final int id;
  final String hari;

  const HariModel({
    required this.id,
    required this.hari,
  });

  factory HariModel.fromJson(Map<String, dynamic> json) {
    return HariModel(
      id: json['id'],
      hari: json['hari'],
    );
  }

  // Map<String, dynamic> toJso() => {
  //       'id': id,
  //       'hari': hari,
  //     };

  @override
  List<Object> get props => [id, hari];
}

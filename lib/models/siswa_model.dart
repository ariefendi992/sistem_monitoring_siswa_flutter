class SiswaModel {
  final String id, username, email, group, namaSiswa;

  SiswaModel({
    required this.id,
    required this.username,
    required this.email,
    required this.group,
    required this.namaSiswa,
  });

  factory SiswaModel.fromJson(Map<String, dynamic> json) {
    return SiswaModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      group: json['group'],
      namaSiswa: json['namaSiswa'],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'group': group,
        'nama_mahasiswa': namaSiswa,
      };
}

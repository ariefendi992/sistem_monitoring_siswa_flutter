class UserDetailModel {
  final String? namaDepan,
      namaBelakang,
      jenisKelamin,
      alamat,
      telp,
      imageProfil;

  UserDetailModel({
    required this.namaDepan,
    required this.namaBelakang,
    required this.jenisKelamin,
    required this.alamat,
    required this.telp,
    required this.imageProfil,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
        namaDepan: json['nama_depan'],
        namaBelakang: json['nama_belakang'],
        jenisKelamin: json['jenisKelamin'],
        alamat: json['alamat'],
        telp: json['telp'],
        imageProfil: json['profil_picture']);
  }
}

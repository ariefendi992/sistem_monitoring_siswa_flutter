class UserDetailModel {
  final String? namaDepan,
      namaBelakang,
      jenisKelamin,
      alamat,
      telp,
      imageProfil,
      kelas;

  UserDetailModel({
    required this.namaDepan,
    required this.namaBelakang,
    required this.jenisKelamin,
    required this.alamat,
    required this.telp,
    required this.imageProfil,
    required this.kelas,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
        namaDepan: json['first_name'],
        namaBelakang: json['last_name'],
        jenisKelamin: json['gender'],
        alamat: json['alamat'],
        telp: json['telp'],
        imageProfil: json['picture'],
        kelas: json['kelas']);
  }
}

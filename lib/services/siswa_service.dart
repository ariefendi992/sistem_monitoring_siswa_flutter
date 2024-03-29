import 'dart:convert';
import 'package:sistem_monitoring_siswa_flutter/models/siswa_model.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/secure_storage.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/url.dart';
import 'package:http/http.dart' as http;

class SiswaService {
  Future<SiswaModel> getOneSiswa() async {
    String id = await SecureStorage().readStorage('id');
    var url = '$baseUrl/api/v2/student/single/$id';

    var response = await http.get(Uri.parse(url));

    // debugPrint('response single siswa = ${response.body}');

    if (response.statusCode == 200) {
      SiswaModel siswa = SiswaModel.fromJson(jsonDecode(response.body));
      return siswa;
    } else {
      throw Exception(
          'Failed load siswa detail data. url $url, status : ${response.statusCode}');
    }
  }

  Future<SiswaModel> generateQrCode() async {
    String id = await SecureStorage().readStorage('id');
    var url = '$baseUrl/api/v2/student/generate-qc?id=$id';
    var header = {'Content-Type': 'application.json'};
    var response = await http.put(Uri.parse(url), headers: header);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      SiswaModel user = SiswaModel.fromJson(data);
      return user;
    } else {
      var data = jsonDecode(response.body);
      throw data['msg'];
    }
  }
}

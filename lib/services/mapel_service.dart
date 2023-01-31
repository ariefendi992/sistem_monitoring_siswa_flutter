import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sistem_monitoring_siswa_flutter/models/mapel_model.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/secure_storage.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/url.dart';

class MapelService {
  Future<List<MapelModel>> getMapel() async {
    String kelasId = await SecureStorage().readStorage('kelas_id');
    final url = '$baseUrl/api/v2/student/mapel-kelas/$kelasId';
    final response = await http.get(Uri.parse(url));

    // debugPrint('response mapel = ${response.body}');

    if (response.statusCode == 200) {
      List<MapelModel> mapel =
          List<MapelModel>.from(jsonDecode(response.body).map((e) {
        return MapelModel.fromJson(e);
      }));
      return mapel;
    } else {
      throw Exception(
          'Gagal Meload data mapel. url : $url, status code : ${response.statusCode}');
    }
  }
}

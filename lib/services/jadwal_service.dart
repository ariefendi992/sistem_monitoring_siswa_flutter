import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sistem_monitoring_siswa_flutter/models/jadwal_belajar_model.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/secure_storage.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/url.dart';

import 'package:http/http.dart' as http;

class JadwalService {
  Future<List<JadwalBelajarModel>> fetchJadwalToday() async {
    String kelasID = await SecureStorage().readStorage('kelas_id');

    var url = '$baseUrl/siswa/jadwal/$kelasID';
    var response = await http.get(Uri.parse(url));
    // debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonResp = jsonDecode(response.body);
      // debugPrint('json resp jadwal today == $jsonResp');

      List<JadwalBelajarModel> jadwalBelajar =
          List<JadwalBelajarModel>.from(jsonResp['data']['today'].map((e) {
        return JadwalBelajarModel.fromJson(e);
      })).toList();

      return jadwalBelajar;
    } else {
      throw Exception(
          'Failed load data mapel, $url, status : ${response.statusCode}');
    }
  }

  Future<List<JadwalBelajarModel>> fetchJadwalTomorrow() async {
    String kelasID = await SecureStorage().readStorage('kelas_id');

    var url = '$baseUrl/siswa/jadwal/$kelasID';
    var response = await http.get(Uri.parse(url));
    // debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonResp = jsonDecode(response.body);
      // debugPrint('json resp jadwal bsok == $jsonResp');

      List<JadwalBelajarModel> jadwalBelajar =
          List<JadwalBelajarModel>.from(jsonResp['data']['tomorrow'].map((e) {
        return JadwalBelajarModel.fromJson(e);
      })).toList();

      return jadwalBelajar;
    } else {
      throw Exception(
          'Failed load data mapel, $url, status : ${response.statusCode}');
    }
  }

  Future<JadwalBelajarModel> fetchOneMapel() async {
    String kelasID = await SecureStorage().readStorage('kelas_id');

    var url = '$baseUrl/siswa/one-mapel/$kelasID';
    var response = await http.get(Uri.parse(url));

    debugPrint('fetch one mapel ${response.body}');

    if (response.statusCode == 404) {
      var noMapel = jsonDecode(response.body);

      return noMapel;
    } else if (response.statusCode == 200) {
      var jsonResp = jsonDecode(response.body);
      JadwalBelajarModel mapel = JadwalBelajarModel.fromJson(jsonResp);

      return mapel;
    } else {
      throw Exception(
          'Failed load data, $url | Status Code = ${response.statusCode}');
    }
  }
}

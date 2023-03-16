import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_monitoring_siswa_flutter/models/master_model.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/url.dart';

class MasterService {
  Future<List<HariModel>> fetchHari() async {
    // final String url = '$baseUrl/api/v2/master/hari/get-all';
    // final response = await http.get(Uri.parse(url));

    // // debugPrint(response.body);

    // var respB = jsonDecode(response.body)['data'];
    // debugPrint(respB.toString());

    // if (response.statusCode == 200) {
    //   List<HariModel> hari =
    //       List<HariModel>.from(jsonDecode(response.body)['data'].map((e) {
    //     return HariModel(id: e.id, hari: e.hari);
    //   }));
    //   return hari;
    // } else {
    //   throw Exception(
    //       'Gagal menampilkan data. url : $url, status code : ${response.statusCode}');
    // }

    try {
      final url = '$baseUrl/api/v2/master/hari/get-all';
      final response = await http.get(Uri.parse(url));

      debugPrint(jsonDecode(response.body)['data'].toString());

      if (response.statusCode == 200) {
        var jsonResp = jsonDecode(response.body);
        var data = jsonResp['data'];
        // List<HariModel> hari = List.from(data).map((e) {
        //   return HariModel.fromJson(e);
        // }).toList();
        List<HariModel> hari =
            List.from(jsonDecode(response.body)['data'].map((e) {
          return HariModel.fromJson(e);
        }));
        return hari;
      } else {
        throw Exception(
            'Gagal menampilkan data. url : $url, status code : ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}

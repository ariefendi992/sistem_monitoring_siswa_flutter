import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sistem_monitoring_siswa_flutter/models/user_model.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/secure_storage.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/url.dart';

class AuthService {
  Future<UserModel> login({
    String? username,
    String? password,
  }) async {
    var route = ('$baseUrl/api/v2/auth/login');

    var header = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'username': username,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(route),
      headers: header,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // debugPrint('Data respon login = $data');

      await SecureStorage().setStorage('group', data['group']);
      await SecureStorage().setStorage('id', data['id'].toString());
      await SecureStorage().setStorage('kelas_id', data['kelas_id'].toString());

      UserModel users = UserModel.fromJson(data);

      return users;
    } else {
      var data = jsonDecode(response.body);
      throw data['msg'];
    }
  }

  Future<void> logOut() async {
    try {
      await SecureStorage().deleteAllStorage();
    } catch (e) {
      rethrow;
    }
  }
}

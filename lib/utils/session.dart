import 'package:sistem_monitoring_siswa_flutter/models/user_model.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/secure_storage.dart';

const isLogin = 'isLogin';
const group = 'group';
const idUser = 'idUser';

enum JenisLogin { admin, siswa, guru }

Future createAdminSession(UserModel user) async {
  SecureStorage().setStorage(isLogin, true);
  SecureStorage().setStorage(group, JenisLogin.admin.toString());
}

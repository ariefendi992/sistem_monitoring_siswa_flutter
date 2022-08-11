import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future setStorage(String key, value) async {
    await storage.write(key: key, value: value);
  }

  Future readStorage(String key) async {
    var readKey = await storage.read(key: key);

    return readKey;
  }

  Future deleteKeyStorage(String key) async {
    await storage.delete(key: key);
  }

  Future deleteAllStorage() async {
    await storage.deleteAll();
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterLocalSecuredStorage {
  FlutterSecureStorage storage = FlutterSecureStorage();

  static final FlutterLocalSecuredStorage _singleton =
      FlutterLocalSecuredStorage._internal();

  factory FlutterLocalSecuredStorage() {
    return _singleton;
  }

  FlutterLocalSecuredStorage._internal();

  read(String data) async {
    // FlutterSecureStorage storage = FlutterSecureStorage();
    var token = await storage.read(key: data);
    return token;
  }

  Future<bool> getbool(String data) async {
    final status = await storage.read(key: data);
    if (status == null || status == '') {
      return false;
    } else {
      return true;
    }
  }

  write(String key, value) async {
    // FlutterSecureStorage storage = FlutterSecureStorage();
    // final storage = new FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }
}

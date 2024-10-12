import 'package:shared_preferences/shared_preferences.dart';

import '../data/services/services.dart';

class LocalStorageService implements LocalStorageClient {
  SharedPreferences? _box;
  final String key;

  LocalStorageService(this.key) {
    init();
  }

  Future<LocalStorageClient> init() async {
    _box = await SharedPreferences.getInstance();
    return this;
  }

  @override
  String? read() {
    try {
      return _box?.getString(key);
    } catch (_) {}
    return null;
  }

  @override
  void write(String value) {
    try {
      _box?.setString(key, value);
    } catch (_) {}
  }
}

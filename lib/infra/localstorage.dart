import 'package:shared_preferences/shared_preferences.dart';

import '../data/services/services.dart';

class LocalStorageService implements LocalStorageClient {
  late SharedPreferences _box;
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
      final result = _box.getString(key);
      return result;
    } catch (_) {
      rethrow;
    }
  }

  @override
  void write(String value) async {
    try {
      await _box.setString(key, value);
    } catch (_) {
      rethrow;
    }
  }
}

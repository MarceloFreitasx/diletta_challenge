import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/services/services.dart';
import '../infra/infra.dart';
import '../main.dart';

class Env {
  Env() {
    to = this;
    baseUrl = const String.fromEnvironment("baseUrl");

    main();
  }

  static Env? to;
  late String baseUrl;

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initServices();
    runApp(const MyApp());
  }

  Future<void> initServices() async {
    await Get.putAsync<LocalStorageClient>(() => LocalStorageService("wishlist").init());
  }
}

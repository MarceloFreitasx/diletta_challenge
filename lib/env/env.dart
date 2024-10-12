import 'package:flutter/material.dart';

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
    runApp(const MyApp());
  }
}

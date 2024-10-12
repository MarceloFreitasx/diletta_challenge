import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'di/di.dart';
import 'env/env.dart';
import 'presentation/navigator/navigator.dart';
import 'ui/styles/styles.dart';

void main() => Env();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Experian Challenge',
      theme: lightTheme,
      getPages: PagesRoutes.routes,
      initialRoute: PagesRoutes.initial,
      initialBinding: AppBindings(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'env/env.dart';
import 'ui/pages/pages.dart';

void main() => Env();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Experian Challenge',
      home: HomePage(),
    );
  }
}

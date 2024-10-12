import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Details Page'),
      ),
    );
  }
}

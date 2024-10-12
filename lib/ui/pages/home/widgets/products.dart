import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../home.dart';

class HomeProductsList extends GetView<HomeController> {
  const HomeProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverToBoxAdapter(child: SizedBox(height: 15)),
        ),
        Obx(() => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: .62,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final item = controller.products[index];
                  return ProductCard(
                    title: item.title ?? '',
                    imageUrl: item.images?.first ?? '',
                    price: item.finalPrice,
                  );
                },
                itemCount: controller.products.length,
              ),
            )),
      ],
    );
  }
}

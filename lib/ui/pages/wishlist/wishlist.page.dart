import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../styles/styles.dart';
import 'wishlist.dart';

class WishlistPage extends GetView<WishlistController> {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: AppTextStyle.body1.copyWith(color: AppColors.black),
        ),
      ),
      body: CustomScrollView(
        slivers: [
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
                      heroTag: item.id.toString(),
                      isFavorited: true,
                      onFavorite: () => controller.onFavoriteProductTap(item),
                      onPressed: () => controller.onProductTap(item),
                    );
                  },
                  itemCount: controller.products.length,
                ),
              )),
        ],
      ),
    );
  }
}

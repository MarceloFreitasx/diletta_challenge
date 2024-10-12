import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/styles.dart';
import 'home.dart';
import 'widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  onPressed: controller.onFavoriteTap,
                  icon: Badge.count(
                    count: 2,
                    child: const Icon(Icons.favorite_border_rounded),
                  ),
                ),
                IconButton(
                  onPressed: controller.onShoppingCartTap,
                  icon: const Icon(Icons.shopping_cart),
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList.list(
                children: [
                  const Text(
                    "Hello",
                    style: AppTextStyle.head2,
                  ),
                  Text(
                    "Welcome to Marcelo's Store.",
                    style: AppTextStyle.body2.copyWith(color: AppColors.gray),
                  ),
                ],
              ),
            ),
          ];
        },
        body: NotificationListener<ScrollUpdateNotification>(
          onNotification: controller.onScrollNotification,
          child: CustomScrollView(
            slivers: [
              const HomeProductsList(),
              SliverToBoxAdapter(
                child: Obx(() => controller.isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : const SizedBox()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

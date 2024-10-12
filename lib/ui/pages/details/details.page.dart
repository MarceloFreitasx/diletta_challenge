import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../infra/infra.dart';
import '../../styles/styles.dart';
import 'details.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar.large(
              pinned: true,
              actions: [
                FavoriteButton(
                  isFavorited: true,
                  onPressed: () {},
                ),
              ],
              expandedHeight: 380,
              stretchTriggerOffset: 600.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: controller.product.id.toString(),
                  child: BackgroundNetworkImage(
                    imageUrl: controller.product.images!.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          children: [
            Obx(() => Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            controller.product.category?.name ?? '',
                            style: AppTextStyle.body3.copyWith(color: AppColors.gray),
                          ),
                          Text(
                            controller.product.title ?? '',
                            style: AppTextStyle.head3,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: AppTextStyle.body3.copyWith(color: AppColors.gray),
                        ),
                        Text(
                          controller.product.finalPrice,
                          style: AppTextStyle.head3,
                        ),
                      ],
                    )
                  ],
                )),
            const SizedBox(height: 20),
            const Text(
              "Description",
              style: AppTextStyle.body1,
            ),
            const SizedBox(height: 10),
            Obx(() => Text(
                  controller.product.description ?? '',
                  style: AppTextStyle.body2.copyWith(color: AppColors.gray),
                )),
          ],
        ),
      ),
    );
  }
}

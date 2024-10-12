import 'package:flutter/material.dart';

import '../../infra/infra.dart';
import '../../styles/styles.dart';
import '../components.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.isFavorited = false,
    this.heroTag,
    this.onPressed,
    this.onFavorite,
  });

  final String title;
  final String imageUrl;
  final String price;
  final bool isFavorited;
  final String? heroTag;
  final VoidCallback? onPressed;
  final VoidCallback? onFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: heroTag ?? imageUrl,
            child: BackgroundNetworkImage(
              height: 200,
              imageUrl: imageUrl,
              alignment: Alignment.topRight,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(15),
              child: FavoriteButton(
                isFavorited: isFavorited,
                onPressed: onFavorite,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            maxLines: 2,
            style: AppTextStyle.body4,
          ),
          Text(
            price,
            style: AppTextStyle.body3,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class WishlistEmpty extends StatelessWidget {
  const WishlistEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your wishlist is\ncurrently empty.",
              style: AppTextStyle.head3.copyWith(color: AppColors.orange),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Explore our catalog on the homepage\nto find products you'd like to save.",
              style: AppTextStyle.body4.copyWith(color: AppColors.gray),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

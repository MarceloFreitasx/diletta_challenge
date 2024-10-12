import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    this.isFavorited = false,
    this.onPressed,
  });

  final bool isFavorited;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorited ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      onPressed: onPressed,
      color: isFavorited ? AppColors.orange : AppColors.cultured,
    );
  }
}

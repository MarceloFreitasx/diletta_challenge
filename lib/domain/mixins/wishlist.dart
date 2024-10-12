import '../entities/entities.dart';

abstract mixin class WishlistMixin {
  bool isFavorited(ProductEntity item);
  void onFavoriteProductTap(ProductEntity item);
}

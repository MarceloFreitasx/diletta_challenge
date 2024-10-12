import '../../../domain/entities/entities.dart';

abstract class WishlistController {
  List<ProductEntity> get products;

  void onFavoriteTap();
  void onProductTap(ProductEntity item);
}

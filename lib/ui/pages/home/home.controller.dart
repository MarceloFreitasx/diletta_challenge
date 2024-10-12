import '../../../domain/entities/entities.dart';
import '../../../domain/mixins/mixins.dart';

abstract class HomeController with LoadingMixin, DebouncerMixin, PaginationMixin, WishlistMixin {
  List<ProductEntity> get products;
  int get amountOfWishlistedProducts;

  void onFavoriteTap();
  void onProductTap(ProductEntity item);
}

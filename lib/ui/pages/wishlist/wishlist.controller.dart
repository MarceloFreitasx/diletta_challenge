import '../../../domain/entities/entities.dart';
import '../../../domain/mixins/mixins.dart';

abstract class WishlistController with WishlistMixin {
  List<ProductEntity> get products;

  void onProductTap(ProductEntity item);
}

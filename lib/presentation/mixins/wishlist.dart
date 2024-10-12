import '../../domain/entities/entities.dart';
import '../../domain/mixins/mixins.dart';
import '../../domain/services/services.dart';

mixin WishlistManager implements WishlistMixin {
  @override
  bool isFavorited(ProductEntity item) => WishlistMediator.instance.hasProduct(item);

  @override
  void onFavoriteProductTap(ProductEntity item) {
    WishlistMediator.instance.add(item);
  }
}

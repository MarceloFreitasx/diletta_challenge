import '../../domain/entities/entities.dart';
import '../../domain/mixins/mixins.dart';
import '../../domain/services/services.dart';

mixin WishlistManager implements WishlistMixin {
  WishlistMediator get wishlistMediator;

  @override
  bool isFavorited(ProductEntity item) => wishlistMediator.hasProduct(item);

  @override
  void onFavoriteProductTap(ProductEntity item) {
    wishlistMediator.add(item);
  }
}

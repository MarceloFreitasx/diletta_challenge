import '../../../domain/entities/entities.dart';
import '../../../domain/mixins/mixins.dart';

abstract class HomeController with LoadingMixin, DebouncerMixin, PaginationMixin {
  List<ProductEntity> get products;

  void onFavoriteTap();
  void onShoppingCartTap();
}

import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../ui/pages/pages.dart';
import '../navigator/navigator.dart';

class WishlistControllerImpl implements WishlistController {
  final _products = <ProductEntity>[].obs;

  @override
  List<ProductEntity> get products => _products;

  @override
  void onFavoriteTap() {}

  @override
  void onProductTap(ProductEntity item) {
    Get.toNamed(AppRoutes.details, arguments: item);
  }
}

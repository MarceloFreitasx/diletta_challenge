import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/services/services.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';
import '../navigator/navigator.dart';

class WishlistControllerImpl with WishlistManager implements WishlistController {
  @override
  List<ProductEntity> get products => WishlistMediator.instance.wishlist;

  @override
  void onProductTap(ProductEntity item) {
    Get.toNamed(AppRoutes.details, arguments: item);
  }
}

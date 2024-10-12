import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class DetailsControllerImpl extends GetxController
    with WishlistManager
    implements DetailsController {
  final _product = Rxn<ProductEntity>();

  @override
  ProductEntity get product => _product.value!;

  @override
  void onInit() {
    if (Get.arguments == null) {
      Get.back(result: "Product not found!");
    }

    _product.value = Get.arguments as ProductEntity;
    super.onInit();
  }
}

import 'dart:developer';

import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/params/params.dart';
import '../../domain/usecases/products_list.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';
import '../navigator/navigator.dart';

class HomeControllerImpl extends GetxController
    with LoadingManager, DebouncerManager, PaginationManager
    implements HomeController {
  HomeControllerImpl(this.productsListUseCase);

  final GetProductsListUseCase productsListUseCase;

  final _products = <ProductEntity>[].obs;
  final _options = OptionsParams();

  @override
  List<ProductEntity> get products => _products;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts({bool loadMore = false}) async {
    if (!loadMore) _options.resetPages();

    try {
      setLoadingStarted();
      final characters = await productsListUseCase.execute(_options);
      if (loadMore) {
        _products.addAll(characters);
      } else {
        _products.assignAll(characters);
      }
      setLoadingCompleted();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onFavoriteTap() {
    Get.toNamed(AppRoutes.wishlist);
  }

  @override
  void onProductTap(ProductEntity item) {
    Get.toNamed(AppRoutes.details, arguments: item);
  }

  @override
  void loadMore() {
    if (isLoading) return;

    _options.nextPage();
    loadProducts(loadMore: true);
  }
}

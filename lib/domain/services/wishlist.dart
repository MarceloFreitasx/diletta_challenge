import 'package:get/get.dart';

import '../entities/entities.dart';
import '../usecases/usecases.dart';

abstract class WishlistMediator {
  static WishlistMediator get instance => Get.find();

  List<ProductEntity> get wishlist;

  void add(ProductEntity item);
  void remove(ProductEntity item);
  bool hasProduct(ProductEntity item);
}

class WishlistMediatorImpl extends GetxController implements WishlistMediator {
  WishlistMediatorImpl(
    this.getFavoriteProductsListUseCase,
    this.addFavoriteProductUseCase,
    this.removeFavoriteProductUseCase,
  );

  final GetFavoriteProductsListUseCase getFavoriteProductsListUseCase;
  final AddFavoriteProductUseCase addFavoriteProductUseCase;
  final RemoveFavoriteProductUseCase removeFavoriteProductUseCase;

  final _wishlist = <ProductEntity>[].obs;

  @override
  List<ProductEntity> get wishlist => _wishlist;

  @override
  bool hasProduct(ProductEntity item) => wishlist.contains(item);

  @override
  void add(ProductEntity item) {
    if (hasProduct(item)) {
      remove(item);
      return;
    }
    addFavoriteProductUseCase.add(item);
    _wishlist.add(item);
  }

  @override
  void remove(ProductEntity item) {
    if (!hasProduct(item)) return;
    removeFavoriteProductUseCase.remove(item);
    _wishlist.remove(item);
  }

  @override
  void onInit() {
    loadWishlist();
    super.onInit();
  }

  void loadWishlist() async {
    _wishlist.assignAll(await getFavoriteProductsListUseCase.execute());
  }
}

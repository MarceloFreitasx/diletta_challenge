import 'package:get/get.dart';

import '../../entities/entities.dart';
import '../../usecases/usecases.dart';
import 'index.dart';

abstract class WishlistMediator with WishlistSearch {
  List<ProductEntity> get wishlist;
  List<ProductEntity> get filteredWishlist;

  void add(ProductEntity item);
  void remove(ProductEntity item);
  void onSearch(String searchTerm);
  bool hasProduct(ProductEntity item);
}

class WishlistMediatorImpl extends GetxController
    with WishlistSearchImpl
    implements WishlistMediator {
  WishlistMediatorImpl(
    this.getFavoriteProductsListUseCase,
    this.addFavoriteProductUseCase,
    this.removeFavoriteProductUseCase,
  );

  final GetFavoriteProductsListUseCase getFavoriteProductsListUseCase;
  final AddFavoriteProductUseCase addFavoriteProductUseCase;
  final RemoveFavoriteProductUseCase removeFavoriteProductUseCase;

  final _wishlist = <ProductEntity>[].obs;
  final _filteredWishlist = <ProductEntity>[].obs;

  @override
  List<ProductEntity> get wishlist => _wishlist;
  @override
  List<ProductEntity> get filteredWishlist => _filteredWishlist;

  @override
  void onInit() {
    loadWishlist();
    super.onInit();
  }

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
    _filteredWishlist.assignAll(List.of(wishlist));
  }

  @override
  void remove(ProductEntity item) {
    if (!hasProduct(item)) return;
    removeFavoriteProductUseCase.remove(item);
    _wishlist.remove(item);
    _filteredWishlist.assignAll(List.of(wishlist));
  }

  @override
  void onSearch(String searchTerm) async {
    final lowerSearchTerm = searchTerm.toLowerCase();
    if (lowerSearchTerm.isEmpty) {
      _filteredWishlist.assignAll(List.of(wishlist));
      return;
    }
    _filteredWishlist.assignAll(await search(wishlist.toList(), lowerSearchTerm));
  }

  void loadWishlist() async {
    _wishlist.assignAll(await getFavoriteProductsListUseCase.execute());
    _filteredWishlist.assignAll(List.of(wishlist));
  }
}

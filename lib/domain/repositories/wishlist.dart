import '../entities/entities.dart';

abstract class WishlistRepository {
  Future<List<ProductEntity>> addProductToWishlist(ProductEntity product);
  Future<List<ProductEntity>> removeProductToWishlist(ProductEntity product);
  Future<List<ProductEntity>> getWishlistedProducts();
}

import '../entities/entities.dart';

abstract class RemoveFavoriteProductUseCase {
  Future<List<ProductEntity>> remove(ProductEntity product);
}

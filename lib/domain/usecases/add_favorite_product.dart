import '../entities/entities.dart';

abstract class AddFavoriteProductUseCase {
  Future<List<ProductEntity>> add(ProductEntity product);
}

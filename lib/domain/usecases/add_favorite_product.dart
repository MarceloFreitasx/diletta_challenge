import '../entities/entities.dart';

abstract class AddFavoriteProductUseCase {
  Future<ProductEntity> add(ProductEntity product);
}

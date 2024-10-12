import '../entities/entities.dart';

abstract class RemoveFavoriteProductUseCase {
  Future<bool> remove(ProductEntity product);
}

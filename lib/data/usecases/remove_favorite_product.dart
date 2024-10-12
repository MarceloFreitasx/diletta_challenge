import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class RemoveFavoriteProductUseCaseImpl implements RemoveFavoriteProductUseCase {
  RemoveFavoriteProductUseCaseImpl({required this.repository});

  final WishlistRepository repository;

  @override
  Future<List<ProductEntity>> remove(ProductEntity product) {
    try {
      return repository.removeProductToWishlist(product);
    } catch (_) {
      rethrow;
    }
  }
}

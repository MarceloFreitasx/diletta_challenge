import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class AddFavoriteProductUseCaseImpl implements AddFavoriteProductUseCase {
  AddFavoriteProductUseCaseImpl({required this.repository});

  final WishlistRepository repository;

  @override
  Future<List<ProductEntity>> add(ProductEntity product) {
    try {
      return repository.addProductToWishlist(product);
    } catch (_) {
      rethrow;
    }
  }
}

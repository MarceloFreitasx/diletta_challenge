import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class GetFavoriteProductsListUseCaseImpl implements GetFavoriteProductsListUseCase {
  GetFavoriteProductsListUseCaseImpl({required this.repository});

  final WishlistRepository repository;

  @override
  Future<List<ProductEntity>> execute() async {
    try {
      return await repository.getWishlistedProducts();
    } catch (_) {
      rethrow;
    }
  }
}

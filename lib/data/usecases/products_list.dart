import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class GetProductsListUseCaseImpl implements GetProductsListUseCase {
  GetProductsListUseCaseImpl({required this.productRepository});

  final ProductRepository productRepository;

  @override
  Future<List<ProductEntity>> execute() async {
    try {
      return await productRepository.getProducts();
    } catch (_) {
      rethrow;
    }
  }
}

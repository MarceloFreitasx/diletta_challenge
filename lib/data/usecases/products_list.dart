import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class GetProductsListUseCaseImpl implements GetProductsListUseCase {
  GetProductsListUseCaseImpl({required this.remoteRepository});

  final ProductRepository remoteRepository;

  @override
  Future<List<ProductEntity>> execute() async {
    try {
      return await remoteRepository.getProducts();
    } catch (_) {
      rethrow;
    }
  }
}

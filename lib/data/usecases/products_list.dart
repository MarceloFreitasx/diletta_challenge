import '../../domain/entities/entities.dart';
import '../../domain/params/params.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class GetProductsListUseCaseImpl implements GetProductsListUseCase {
  GetProductsListUseCaseImpl({required this.remoteRepository});

  final ProductRepository remoteRepository;

  @override
  Future<List<ProductEntity>> execute(OptionsParams options) async {
    try {
      return await remoteRepository.getProducts(options);
    } catch (_) {
      rethrow;
    }
  }
}

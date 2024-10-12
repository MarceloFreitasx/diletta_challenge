import '../../domain/entities/entities.dart';
import '../../domain/params/params.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class GetProductsListUseCaseImpl implements GetProductsListUseCase {
  GetProductsListUseCaseImpl({required this.repository});

  final ProductRepository repository;

  @override
  Future<List<ProductEntity>> execute(OptionsParams options) async {
    try {
      return await repository.getProducts(options);
    } catch (_) {
      rethrow;
    }
  }
}

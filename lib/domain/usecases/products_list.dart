import '../entities/entities.dart';
import '../params/params.dart';

abstract class GetProductsListUseCase {
  Future<List<ProductEntity>> execute(OptionsParams params);
}

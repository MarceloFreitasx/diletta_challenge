import '../entities/entities.dart';
import '../params/params.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts(OptionsParams options);
}

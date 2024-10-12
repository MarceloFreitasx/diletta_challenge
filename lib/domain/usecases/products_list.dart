import 'package:diletta_challenge/domain/entities/entities.dart';

abstract class GetProductsListUseCase {
  Future<List<ProductEntity>> execute();
}

import 'package:diletta_challenge/domain/entities/entities.dart';

abstract class GetFavoriteProductsListUseCase {
  Future<List<ProductEntity>> execute();
}

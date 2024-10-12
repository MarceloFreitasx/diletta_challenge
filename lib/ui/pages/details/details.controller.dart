import '../../../domain/entities/entities.dart';
import '../../../domain/mixins/mixins.dart';

abstract class DetailsController with WishlistMixin {
  ProductEntity get product;
}

import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/mixins/mixins.dart';

abstract class WishlistController with WishlistMixin, DebouncerMixin {
  List<ProductEntity> get products;
  TextEditingController get searchController;

  void onProductTap(ProductEntity item);
  void onSearch();
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/services/services.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';
import '../navigator/navigator.dart';

class WishlistControllerImpl with WishlistManager, DebouncerManager implements WishlistController {
  @override
  List<ProductEntity> get products => WishlistMediator.instance.filteredWishlist;

  @override
  TextEditingController searchController = TextEditingController();

  @override
  void onProductTap(ProductEntity item) {
    Get.toNamed(AppRoutes.details, arguments: item);
  }

  @override
  void onSearch() {
    debouncerRun(() {
      WishlistMediator.instance.onSearch(searchController.text);
    });
  }
}

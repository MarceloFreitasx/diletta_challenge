import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/services/services.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';
import '../navigator/navigator.dart';

class WishlistControllerImpl with WishlistManager, DebouncerManager implements WishlistController {
  WishlistControllerImpl(this.wishlistMediator);

  @override
  final WishlistMediator wishlistMediator;

  @override
  List<ProductEntity> get products => wishlistMediator.filteredWishlist;

  @override
  TextEditingController searchController = TextEditingController();

  @override
  void onProductTap(ProductEntity item) {
    Get.toNamed(AppRoutes.details, arguments: item);
  }

  @override
  void onSearch() {
    debouncerRun(() {
      wishlistMediator.onSearch(searchController.text);
    });
  }
}

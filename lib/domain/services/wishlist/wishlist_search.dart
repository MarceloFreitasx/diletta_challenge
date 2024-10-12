import 'package:flutter/foundation.dart';

import '../../entities/entities.dart';

abstract mixin class WishlistSearch {
  Future<List<ProductEntity>> search(List<ProductEntity> wishlist, String searchTerm);
}

mixin class WishlistSearchImpl implements WishlistSearch {
  @override
  Future<List<ProductEntity>> search(List<ProductEntity> wishlist, String searchTerm) async {
    return await compute(_filterInBackground, {
      'originalList': wishlist,
      'searchTerm': searchTerm,
    });
  }

  static List<ProductEntity> _filterInBackground(Map<String, dynamic> data) {
    List<ProductEntity> originalList = data['originalList'] as List<ProductEntity>;
    String searchTerm = data['searchTerm'];

    List<ProductEntity> result = originalList
        .where((element) => element.title!.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();

    return result;
  }
}

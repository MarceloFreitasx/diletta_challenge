import 'package:get/get.dart';

import '../data/usecases/usecases.dart';
import '../domain/repositories/repositories.dart';
import '../domain/usecases/usecases.dart';

class UseCasesBindings {
  static void init() {
    Get.lazyPut<GetProductsListUseCase>(
      () => GetProductsListUseCaseImpl(repository: Get.find<ProductRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetFavoriteProductsListUseCase>(
      () => GetFavoriteProductsListUseCaseImpl(repository: Get.find<WishlistRepository>()),
      fenix: true,
    );
    Get.lazyPut<AddFavoriteProductUseCase>(
      () => AddFavoriteProductUseCaseImpl(repository: Get.find<WishlistRepository>()),
      fenix: true,
    );
    Get.lazyPut<RemoveFavoriteProductUseCase>(
      () => RemoveFavoriteProductUseCaseImpl(repository: Get.find<WishlistRepository>()),
      fenix: true,
    );
  }
}

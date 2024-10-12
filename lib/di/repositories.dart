import 'package:get/get.dart';

import '../data/datasources/datasources.dart';
import '../data/services/services.dart';
import '../domain/repositories/repositories.dart';

class RepositoriesBindings {
  static void init() {
    Get.lazyPut<ProductRepository>(
      () => RemoteProductsDataSource(client: Get.find<HttpClient>()),
      fenix: true,
    );
    Get.lazyPut<WishlistRepository>(
      () => LocalWishlistDataSource(client: Get.find<LocalStorageClient>()),
      fenix: true,
    );
  }
}

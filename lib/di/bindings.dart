import 'package:get/get.dart';

import '../data/services/services.dart';
import '../domain/services/services.dart';
import '../domain/usecases/usecases.dart';
import '../infra/infra.dart';
import 'di.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    //? Services
    Get.put<HttpClient>(HttpService());
    Get.put<LocalStorageClient>(LocalStorageService("wishlist"));

    //? Repositories
    RepositoriesBindings.init();
    //? UseCases
    UseCasesBindings.init();
    //? Mediators
    Get.put<WishlistMediator>(WishlistMediatorImpl(
      Get.find<GetFavoriteProductsListUseCase>(),
      Get.find<AddFavoriteProductUseCase>(),
      Get.find<RemoveFavoriteProductUseCase>(),
    ));
    //? Controllers
    ControllersBindings.init();
  }
}

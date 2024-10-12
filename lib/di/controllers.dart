import 'package:get/get.dart';

import '../domain/services/services.dart';
import '../domain/usecases/usecases.dart';
import '../presentation/controllers/controllers.dart';
import '../ui/pages/pages.dart';

class ControllersBindings {
  static void init() {
    Get.lazyPut<HomeController>(
      () => HomeControllerImpl(
        Get.find<GetProductsListUseCase>(),
        Get.find<WishlistMediator>(),
      ),
      fenix: true,
    );
    Get.lazyPut<DetailsController>(
      () => DetailsControllerImpl(Get.find<WishlistMediator>()),
      fenix: true,
    );
    Get.lazyPut<WishlistController>(
      () => WishlistControllerImpl(Get.find<WishlistMediator>()),
      fenix: true,
    );
  }
}

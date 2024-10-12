import 'package:get/get.dart';

import '../domain/usecases/usecases.dart';
import '../presentation/controllers/controllers.dart';
import '../ui/pages/pages.dart';

class ControllersBindings {
  static void init() {
    Get.lazyPut<HomeController>(
      () => HomeControllerImpl(Get.find<GetProductsListUseCase>()),
      fenix: true,
    );
    Get.lazyPut<DetailsController>(
      () => DetailsControllerImpl(),
      fenix: true,
    );
  }
}

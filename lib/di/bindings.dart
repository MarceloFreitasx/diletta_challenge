import 'package:get/get.dart';

import '../data/datasources/datasources.dart';
import '../data/services/services.dart';
import '../data/usecases/usecases.dart';
import '../domain/repositories/repositories.dart';
import '../domain/usecases/usecases.dart';
import '../infra/infra.dart';
import '../presentation/controllers/controllers.dart';
import '../ui/pages/pages.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    //? Services
    Get.put<HttpClient>(HttpService());

    //? Repositories
    Get.lazyPut<ProductRepository>(
      () => RemoteProductsDataSource(httpClient: Get.find<HttpClient>()),
      fenix: true,
    );

    //? UseCases
    Get.lazyPut<GetProductsListUseCase>(
      () => GetProductsListUseCaseImpl(remoteRepository: Get.find<ProductRepository>()),
      fenix: true,
    );

    //? Controllers
    Get.lazyPut<HomeController>(
      () => HomeControllerImpl(Get.find<GetProductsListUseCase>()),
      fenix: true,
    );
  }
}

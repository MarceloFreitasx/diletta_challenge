import 'package:get/get.dart';

import '../data/datasources/datasources.dart';
import '../data/services/services.dart';
import '../domain/repositories/repositories.dart';
import '../infra/infra.dart';
import 'di.dart';

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
    UseCasesBindings.init();
    //? Controllers
    ControllersBindings.init();
  }
}

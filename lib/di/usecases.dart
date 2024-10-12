import 'package:get/get.dart';

import '../data/usecases/usecases.dart';
import '../domain/repositories/repositories.dart';
import '../domain/usecases/usecases.dart';

class UseCasesBindings {
  static void init() {
    Get.lazyPut<GetProductsListUseCase>(
      () => GetProductsListUseCaseImpl(remoteRepository: Get.find<ProductRepository>()),
      fenix: true,
    );
  }
}

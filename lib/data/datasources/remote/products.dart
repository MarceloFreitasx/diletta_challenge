import '../../../domain/entities/entities.dart';
import '../../../domain/repositories/repositories.dart';
import '../../helpers/helpers.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class RemoteProductsDataSource implements ProductRepository {
  RemoteProductsDataSource({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final request = await httpClient.request(
        method: HttpMethod.get,
        url: "/products",
      );

      final data = request.data as List<dynamic>;
      return data.map((element) => ProductModel.fromJson(element).toEntity()).toList();
    } catch (_) {
      rethrow;
    }
  }
}

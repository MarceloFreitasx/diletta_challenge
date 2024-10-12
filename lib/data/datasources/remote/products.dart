import '../../../domain/entities/entities.dart';
import '../../../domain/params/params.dart';
import '../../../domain/repositories/repositories.dart';
import '../../helpers/helpers.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class RemoteProductsDataSource implements ProductRepository {
  RemoteProductsDataSource({required this.client});

  final HttpClient client;

  @override
  Future<List<ProductEntity>> getProducts(OptionsParams options) async {
    try {
      final request = await client.request(
        method: HttpMethod.get,
        url: "/products",
        data: options.toMap(),
      );

      final data = request.data as List<dynamic>;
      return data.map((element) => ProductModel.fromJson(element).toEntity()).toList();
    } catch (_) {
      rethrow;
    }
  }
}

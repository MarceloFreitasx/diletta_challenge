import 'dart:convert';

import '../../../domain/entities/entities.dart';
import '../../../domain/repositories/repositories.dart';
import '../../services/services.dart';

class LocalWishlistDataSource implements WishlistRepository {
  final LocalStorageClient client;

  LocalWishlistDataSource({required this.client});

  @override
  Future<List<ProductEntity>> addProductToWishlist(ProductEntity product) async {
    try {
      final request = client.read();
      if (request == null) return [];

      final result = stringToEntity(request);
      result.add(product);
      client.write(jsonEncode(result.map((e) => e.toJson()).toList()));
      return result;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ProductEntity>> removeProductToWishlist(ProductEntity product) async {
    try {
      final request = client.read();
      if (request == null) return [];

      final result = stringToEntity(request);
      result.removeWhere((element) => element.id == product.id);
      client.write(jsonEncode(result.map((e) => e.toJson()).toList()));
      return result;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ProductEntity>> getWishlistedProducts() async {
    try {
      final request = client.read();
      if (request == null) return [];

      return stringToEntity(request);
    } catch (_) {
      rethrow;
    }
  }

  List<ProductEntity> stringToEntity(String request) {
    final data = jsonDecode(request);
    return data.map((element) => ProductEntity.fromJson(element)).toList();
  }
}

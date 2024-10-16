import 'package:diletta_challenge/data/services/services.dart';
import 'package:diletta_challenge/domain/repositories/repositories.dart';
import 'package:diletta_challenge/domain/usecases/usecases.dart';
import 'package:mocktail/mocktail.dart';

//? Infra
class MockHttpClient extends Mock implements HttpClient {}

//? Repositories
class MockProductRepository extends Mock implements ProductRepository {}

//? Use Cases
class MockGetProductsListUseCase extends Mock implements GetProductsListUseCase {}

class MockGetFavoriteProductsListUseCase extends Mock implements GetFavoriteProductsListUseCase {}

class MockAddFavoriteProductUseCase extends Mock implements AddFavoriteProductUseCase {}

class MockRemoveFavoriteProductUseCase extends Mock implements RemoveFavoriteProductUseCase {}

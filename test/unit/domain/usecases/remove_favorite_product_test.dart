import 'package:diletta_challenge/domain/entities/entities.dart';
import 'package:diletta_challenge/domain/usecases/usecases.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group('RemoveFavoriteProductUseCase', () {
    late RemoveFavoriteProductUseCase sut;
    late ProductEntity product;
    late List<ProductEntity> products;

    setUp(() {
      sut = MockRemoveFavoriteProductUseCase();
      product =
          ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name());
      products = [
        ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name()),
      ];
    });

    test('should remove favorite product', () async {
      when(() => sut.remove(product)).thenAnswer((_) async => products);

      final entity = await sut.remove(product);

      expect(entity, isA<List<ProductEntity>>());
      expect(entity.last.id, isNot(product.id));
      expect(entity.last.title, isNot(product.title));
      verify(() => sut.remove(product)).called(1);
    });

    test('should throw an exception when usecase throws an exception', () async {
      when(() => sut.remove(product)).thenThrow(Exception('Error removing favorite product'));

      expect(() => sut.remove(product), throwsException);
    });
  });
}

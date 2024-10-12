import 'package:diletta_challenge/domain/entities/entities.dart';
import 'package:diletta_challenge/domain/usecases/usecases.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group('AddFavoriteProductUseCase', () {
    late AddFavoriteProductUseCase sut;
    late ProductEntity product;
    late List<ProductEntity> products;

    setUp(() {
      sut = MockAddFavoriteProductUseCase();
      product =
          ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name());
      products = [
        ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name()),
        product,
      ];
    });

    test('should add a product to the favorites list', () async {
      when(() => sut.add(product)).thenAnswer((_) async => products);

      final entity = await sut.add(product);

      expect(entity, isA<List<ProductEntity>>());
      expect(entity.last.id, product.id);
      expect(entity.last.title, product.title);
      verify(() => sut.add(product)).called(1);
    });

    test('should throw an exception when usecase throws an exception', () async {
      when(() => sut.add(product)).thenThrow(Exception('Error add favorite product'));

      expect(() => sut.add(product), throwsException);
    });
  });
}

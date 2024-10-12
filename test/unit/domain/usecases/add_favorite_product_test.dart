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

    setUp(() {
      sut = MockAddFavoriteProductUseCase();
      product =
          ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name());
    });

    test('should add a product to the favorites list', () async {
      when(() => sut.add(product)).thenAnswer((_) async => product);

      final entity = await sut.add(product);

      expect(entity, isA<ProductEntity>());
      expect(entity.id, product.id);
      expect(entity.title, product.title);
    });

    test('should throw an exception when usecase throws an exception', () async {
      when(() => sut.add(product)).thenThrow(Exception('Error add favorite product'));

      expect(() => sut.add(product), throwsException);
    });
  });
}

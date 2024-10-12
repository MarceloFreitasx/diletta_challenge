import 'package:diletta_challenge/domain/entities/entities.dart';
import 'package:diletta_challenge/domain/usecases/usecases.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group('GetFavoriteProductsListUseCase', () {
    late GetFavoriteProductsListUseCase sut;

    setUp(() {
      sut = MockGetFavoriteProductsListUseCase();
    });

    test('should return a list of favorite products entity', () async {
      when(() => sut.execute()).thenAnswer(
        (_) async => [
          ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name()),
          ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name()),
        ],
      );

      final entity = await sut.execute();

      expect(entity, isA<List<ProductEntity>>());
      expect(entity.length, 2);
    });

    test('should throw an exception when usecase throws an exception', () async {
      when(() => sut.execute()).thenThrow(Exception('Error fetching favorite products'));

      expect(() => sut.execute(), throwsException);
    });
  });
}

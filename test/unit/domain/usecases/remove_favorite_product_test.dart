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

    setUp(() {
      sut = MockRemoveFavoriteProductUseCase();
      product =
          ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name());
    });

    test('should remove favorite product', () async {
      when(() => sut.remove(product)).thenAnswer((_) async => true);

      final entity = await sut.remove(product);

      expect(entity, isA<bool>());
      expect(entity, true);
    });

    test('should throw an exception when usecase throws an exception', () async {
      when(() => sut.remove(product)).thenThrow(Exception('Error removing favorite product'));

      expect(() => sut.remove(product), throwsException);
    });
  });
}

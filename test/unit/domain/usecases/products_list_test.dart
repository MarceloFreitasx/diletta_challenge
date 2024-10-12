import 'package:diletta_challenge/domain/entities/entities.dart';
import 'package:diletta_challenge/domain/params/params.dart';
import 'package:diletta_challenge/domain/usecases/usecases.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group('GetProductsListUseCase', () {
    late GetProductsListUseCase sut;
    final OptionsParams options = OptionsParams();

    setUp(() {
      sut = MockGetProductsListUseCase();
    });

    test('should return a list of products entity', () async {
      when(() => sut.execute(options)).thenAnswer(
        (_) async => [
          ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name()),
          ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name()),
        ],
      );

      final entity = await sut.execute(options);

      expect(entity, isA<List<ProductEntity>>());
      expect(entity.length, 2);
    });

    test('should throw an exception when usecase throws an exception', () async {
      when(() => sut.execute(options)).thenThrow(Exception('Error fetching products list'));

      expect(() => sut.execute(options), throwsException);
    });
  });
}

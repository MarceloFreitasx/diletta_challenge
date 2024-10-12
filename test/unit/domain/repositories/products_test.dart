import 'package:diletta_challenge/domain/entities/entities.dart';
import 'package:diletta_challenge/domain/params/options.dart';
import 'package:diletta_challenge/domain/repositories/repositories.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group('ProductRepository', () {
    late ProductRepository sut;
    final OptionsParams options = OptionsParams();

    setUp(() {
      sut = MockProductRepository();
    });

    test('should return a list of products entity', () async {
      when(() => sut.getProducts(options)).thenAnswer(
        (_) async => [
          ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name()),
          ProductEntity(id: faker.randomGenerator.integer(1000000), title: faker.company.name()),
        ],
      );

      final entity = await sut.getProducts(options);

      expect(entity, isA<List<ProductEntity>>());
      expect(entity.length, 2);
    });

    test('should throw an exception when usecase throws an exception', () async {
      when(() => sut.getProducts(options)).thenThrow(Exception('Error fetching products'));

      expect(() => sut.getProducts(options), throwsException);
    });
  });
}

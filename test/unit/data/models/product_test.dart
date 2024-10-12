import 'package:diletta_challenge/data/models/models.dart';
import 'package:diletta_challenge/domain/entities/entities.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;
  late ProductModel model;

  setUp(() {
    json = {
      "id": faker.randomGenerator.integer(1000000),
      "title": faker.person.name(),
      "price": faker.randomGenerator.decimal(),
      "description": faker.lorem.sentence(),
      "images": [
        faker.image.loremPicsum(imageFormat: ImageFormat.jpg),
        faker.image.loremPicsum(imageFormat: ImageFormat.jpg),
        faker.image.loremPicsum(imageFormat: ImageFormat.jpg),
      ],
      "creationAt": faker.date.dateTime().toIso8601String(),
      "updatedAt": faker.date.dateTime().toIso8601String(),
      "category": {
        "id": faker.randomGenerator.integer(1000000),
        "name": faker.person.name(),
        "image": faker.image.loremPicsum(imageFormat: ImageFormat.jpg),
        "creationAt": faker.date.dateTime().toIso8601String(),
        "updatedAt": faker.date.dateTime().toIso8601String(),
      }
    };
  });

  group('ProductModel', () {
    test('fromJson should create a valid model from a JSON map', () {
      model = ProductModel.fromJson(json);

      expect(model.id, json["id"]);
      expect(model.title, json["title"]);
      expect(model.description, json["description"]);
      expect(model.price, json["price"]);
      expect(model.images?.first, json["images"][0]);
      expect(model.creationAt, json["creationAt"]);
      expect(model.updatedAt, json["updatedAt"]);
    });

    test('toEntity should convert an model to an entity', () {
      final entity = model.toEntity();

      expect(entity.id, model.id);
      expect(entity.title, model.title);
      expect(entity.description, model.description);
      expect(entity.price, model.price);
      expect(entity.images?.first, model.images?[0]);
      expect(entity.creationAt?.toIso8601String(), model.creationAt);
      expect(entity.updatedAt?.toIso8601String(), model.updatedAt);
      expect(entity.category, isA<CategoryEntity>());
    });

    test('fromJson should handle empty values', () {
      final json = {
        "id": -1,
        "title": "",
        "images": [],
      };

      final model = ProductModel.fromJson(json);

      expect(model.id, -1);
      expect(model.title, "");
      expect(model.images, <String>[]);
    });

    test('fromJson should handle null values', () {
      final json = {
        "id": null,
        "title": null,
        "images": null,
        "creationAt": null,
        "updatedAt": null,
      };

      final model = ProductModel.fromJson(json);

      expect(model.id, null);
      expect(model.title, null);
      expect(model.images, null);
      expect(model.creationAt, null);
      expect(model.updatedAt, null);
    });

    test('fromJson should handle missing fields', () {
      final json = {
        "id": faker.randomGenerator.integer(1000000),
        "title": faker.person.name(),
      }; // Missing fields

      final model = ProductModel.fromJson(json);

      expect(model.id, json["id"]);
      expect(model.title, json["title"]);
      expect(model.images, null); // Should be null if missing
    });
  });
}

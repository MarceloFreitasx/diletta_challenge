import 'package:diletta_challenge/data/models/models.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;
  late CategoryModel model;

  setUp(() {
    json = {
      "id": faker.randomGenerator.integer(1000000),
      "name": faker.person.name(),
      "image": faker.image.loremPicsum(imageFormat: ImageFormat.jpg),
      "creationAt": faker.date.dateTime().toIso8601String(),
      "updatedAt": faker.date.dateTime().toIso8601String(),
    };
  });

  group('CategoryModel', () {
    test('fromJson should create a valid model from a JSON map', () {
      model = CategoryModel.fromJson(json);

      expect(model.id, json["id"]);
      expect(model.name, json["name"]);
      expect(model.image, json["image"]);
      expect(model.creationAt, json["creationAt"]);
      expect(model.updatedAt, json["updatedAt"]);
    });

    test('toEntity should convert an model to an entity', () {
      final entity = model.toEntity();

      expect(entity.id, model.id);
      expect(entity.name, model.name);
      expect(entity.image, model.image);
      expect(entity.creationAt?.toIso8601String(), model.creationAt);
      expect(entity.updatedAt?.toIso8601String(), model.updatedAt);
    });

    test('fromJson should handle empty values', () {
      final json = {
        "id": -1,
        "name": "",
        "image": "",
      };

      final model = CategoryModel.fromJson(json);

      expect(model.id, -1);
      expect(model.name, "");
      expect(model.image, "");
    });

    test('fromJson should handle null values', () {
      final json = {
        "id": null,
        "name": null,
        "image": null,
        "creationAt": null,
        "updatedAt": null,
      };

      final model = CategoryModel.fromJson(json);

      expect(model.id, null);
      expect(model.name, null);
      expect(model.image, null);
      expect(model.creationAt, null);
      expect(model.updatedAt, null);
    });

    test('fromJson should handle missing fields', () {
      final json = {
        "id": faker.randomGenerator.integer(1000000),
        "name": faker.person.name(),
      }; // Missing fields

      final model = CategoryModel.fromJson(json);

      expect(model.id, json["id"]);
      expect(model.name, json["name"]);
      expect(model.image, null); // Should be null if missing
    });
  });
}

import 'package:diletta_challenge/ui/components/cards/cards.dart';
import 'package:diletta_challenge/ui/infra/infra.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../helpers.dart';

void main() {
  group("Component ProductCard widgets tests:", () {
    late String title;
    late String price;
    late String image;

    setUp(() {
      title = faker.person.name();
      price = faker.randomGenerator.decimal().toString();
      image = faker.image.loremPicsum(imageFormat: ImageFormat.jpg);
    });

    testWidgets("Should pump ProductCard with correct Image", (WidgetTester tester) async {
      await mockNetworkImagesFor(() async => await tester.pumpWidget(
            makeTestable(ProductCard(
              title: title,
              imageUrl: image,
              price: price,
            )),
          ));

      await tester.pumpAndSettle();
      expect(find.text(title), findsOneWidget);
      expect(find.text(price), findsOneWidget);
      expect(find.byType(BackgroundNetworkImage), findsOneWidget);
    });
  });
}

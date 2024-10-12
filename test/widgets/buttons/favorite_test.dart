import 'package:diletta_challenge/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  group("Component FavoriteButton widgets tests:", () {
    testWidgets("Should pump FavoriteButton with correct icon", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(const FavoriteButton()));

      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
    });

    testWidgets("Should pump FavoriteButton isFavorite as TRUE and with correct icon",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(const FavoriteButton(
        isFavorited: true,
      )));

      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
    });
  });
}

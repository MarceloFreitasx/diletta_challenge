import 'package:diletta_challenge/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  group("Component TextFieldInput widgets tests:", () {
    const title = "Search...";
    const icon = Icons.search;

    testWidgets("Should pump TextFieldInput with correct text and icon",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(TextFieldInput(
          controller: TextEditingController(),
          hintText: title,
          prefixIcon: icon,
        )),
      );

      await tester.pumpAndSettle();
      expect(find.text(title), findsOneWidget);
      expect(find.byIcon(icon), findsOneWidget);
    });
  });
}

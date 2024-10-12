import 'package:diletta_challenge/ui/components/components.dart';
import 'package:diletta_challenge/ui/pages/pages.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/utils.dart';

class HomePageRobot {
  HomePageRobot(this.tester);

  final WidgetTester tester;

  Future<void> run() async {
    await tester.runAsync(() async {
      await verify();
      await validation();
    });
  }

  Future<void> verify() async {
    await TestHelper.pumpApp(tester);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    final card = find.byType(ProductCard).first;
    expect(card, findsOneWidget);
    await tester.tap(card);
  }

  Future<void> validation() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(DetailsPage), findsOneWidget);
  }
}

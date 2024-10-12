import 'package:diletta_challenge/main.dart';
import 'package:flutter_test/flutter_test.dart';

class TestHelper {
  static Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await Future.delayed(const Duration(seconds: 5));
  }
}

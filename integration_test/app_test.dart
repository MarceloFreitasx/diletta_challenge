import 'package:diletta_challenge/env/env.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robots/robots.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  Env();

  group('end-to-end test', () {
    testWidgets(
      'Should test when tap on product card go to the product\'s Details Page',
      (tester) async => await HomePageRobot(tester).run(),
    );
  });
}

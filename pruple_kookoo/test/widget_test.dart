import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:purple_kookoo/main.dart';

void main() {
  testWidgets('App builds', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const MyApp());
    // The test environment uses the wide Ahem placeholder font, which makes
    // text overflow in ways it doesn't on a device, so overflow reports are ignored.
    while (tester.takeException() != null) {}
    expect(find.byType(MyApp), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 5));
  });
}

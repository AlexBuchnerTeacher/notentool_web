import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:induscore/main.dart';

void main() {
  testWidgets('App loads with login screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: InduScoreApp()));

    // Verify that login screen appears
    expect(find.text('InduScore'), findsWidgets);
    expect(find.text('Anmelden'), findsOneWidget);
  });
}

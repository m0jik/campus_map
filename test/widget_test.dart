import 'package:flutter_test/flutter_test.dart';

import 'package:campus_map/main.dart'; // adjust if your package name differs

void main() {
  testWidgets('CampusMapApp shows hello text', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const CampusMapApp());

    // Verify that the text appears
    expect(find.text('Hello iOS Build!'), findsOneWidget);

    // Verify that the AppBar title appears
    expect(find.text('Campus Map'), findsOneWidget);

    // Verify that the counter text does not exist anymore
    expect(find.text('0'), findsNothing);
  });
}

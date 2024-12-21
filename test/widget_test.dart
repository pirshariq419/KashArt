import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(MyApp());  // Replace with your actual app entry point

    // Verify the initial state of the counter
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify the counter increments
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

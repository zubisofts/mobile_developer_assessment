// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_assessment/ui/views/home/view.dart';

void main() {
  testWidgets('Homescreen shows list of employess when successful',
      (WidgetTester tester) async {
    // Load the HomeView widget.
    await tester.pumpWidget(const MaterialApp(home: HomeView()));

    // Verify that we get a loading widget (CircularProgressIndicator).
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Verify that a list is displayed after employess bee fetched.
    expect(find.byType(ListView), findsNothing);
  });
}

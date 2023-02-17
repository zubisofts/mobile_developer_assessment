import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_assessment/main.dart' as app;
import 'package:mobile_assessment/ui/views/home/widgets/employee_tile.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Launch homescreen load and display employee list",
      (tester) async {
    await restoreFlutterError(() async {
      app.main();
      await tester.pumpAndSettle();
    });

    // var loadingIndicator = find.byType(CircularProgressIndicator);
    // expect(loadingIndicator, findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Check we have an loading indicator
    var listview = find.byType(ListView);
    expect(listview, findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Tap on the first item
    await tester.tap(find.byType(EmployeeTile).first);

    await tester.pumpAndSettle(const Duration(seconds: 2));
  });
}

Future<void> restoreFlutterError(Future<void> Function() call) async {
  final originalOnError = FlutterError.onError!;
  await call();
  final overriddenOnError = FlutterError.onError!;

  // restore FlutterError.onError
  FlutterError.onError = (FlutterErrorDetails details) {
    if (overriddenOnError != originalOnError) overriddenOnError(details);
    originalOnError(details);
  };
}

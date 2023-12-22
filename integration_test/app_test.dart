import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:practice/main.dart'; // Update with your app's main.dart file

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('switch between list and grid views', (tester) async {
    // Build your app and start it.
    await tester.pumpWidget(MyApp()); // Update with your app's entry point

    // Verify the initial state (list view).
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(GridView), findsNothing);

    // Find the icon button to switch to grid view.
    final gridViewIcon = find.byIcon(Icons.grid_view);

    // Tap the icon button.
    await tester.tap(gridViewIcon);
    await tester.pumpAndSettle();

    // Verify that the grid view is now displayed.
    expect(find.byType(ListView), findsNothing);
    expect(find.byType(GridView), findsOneWidget);

    // Find the icon button to switch back to list view.
    final listViewIcon = find.byIcon(Icons.list);

    // Tap the icon button again.
    await tester.tap(listViewIcon);
    await tester.pumpAndSettle();

    // Verify that we are back to the list view.
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
  });
}

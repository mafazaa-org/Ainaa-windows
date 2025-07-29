import 'package:Ainaa/constants/confirm_overlay.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('ConfirmOverlay', () {
    late Widget testWidget;
    final String showOverlayText = 'Show Overlay';
    final String overlayText = 'Test';

    setUp(() {
      testWidget = MaterialApp(
        home: Builder(
          builder:
              (context) => Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed:
                        () => ConfirmOverlay.show(context, Text(overlayText)),
                    child: Text(showOverlayText),
                  ),
                ),
              ),
        ),
      );
    });

    testWidgets('shows overlay when called', (tester) async {
      await tester.pumpWidget(testWidget);

      // Initially no overlay
      expect(find.text(overlayText), findsNothing);

      // Switch Confirm Overlay
      await tester.tap(find.text(showOverlayText));
      await tester.pump();

      // Overlay should be visible
      expect(find.text(overlayText), findsOneWidget);

      // reset
      ConfirmOverlay.hide(tester.element(find.text(overlayText)));
      await tester.pump();
    });

    testWidgets('hides overlay when called', (tester) async {
      await tester.pumpWidget(testWidget);

      // Switch Confirm Overlay
      await tester.tap(find.text(showOverlayText));
      await tester.pump();
      expect(find.text(overlayText), findsOneWidget);

      // Hide overlay
      ConfirmOverlay.hide(tester.element(find.text(overlayText)));
      await tester.pump();

      // Overlay should be gone
      expect(find.text(overlayText), findsNothing);
    });

    testWidgets('does not show multiple overlays', (tester) async {
      await tester.pumpWidget(testWidget);

      // Switch Confirm Overlay multiple times
      await tester.tap(find.text(showOverlayText));
      await tester.tap(find.text(showOverlayText));
      await tester.tap(find.text(showOverlayText));
      await tester.pump();

      // Only one overlay should exist
      expect(find.text(overlayText), findsOneWidget);
    });

    testWidgets('does not crash when hiding non-existent overlay', (
      tester,
    ) async {
      await tester.pumpWidget(testWidget);

      // Try to hide when no overlay exists
      ConfirmOverlay.hide(tester.element(find.byType(Scaffold)));
      await tester.pump();

      // Should not throw
      expect(find.text(overlayText), findsNothing);
    });
  });
}

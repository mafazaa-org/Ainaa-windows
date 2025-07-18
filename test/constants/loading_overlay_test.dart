import 'package:blocker_windows/constants/loading_overlay.dart';
import 'package:blocker_windows/core/shared_widgets/app_loading_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Widget testWidget;
  final String showOverlayText = 'Show Loading Overlay';

  setUp(() {
    testWidget = MaterialApp(
      home: Scaffold(
        body: Builder(
          builder:
              (context) => ElevatedButton(
                onPressed: () => LoadingOverlay.show(context),
                child: Text(showOverlayText),
              ),
        ),
      ),
    );
  });
  group('LoadingOverlay', () {
    testWidgets('shows one overlay with AppLoadingLayout', (tester) async {
      await tester.pumpWidget(testWidget);

      // Show overlay
      await tester.tap(find.text(showOverlayText));
      await tester.pump();

      // Verify overlay is shown with AppLoadingLayout
      expect(find.byType(AppLoadingLayout), findsOneWidget);

      // only one loading overlay
      LoadingOverlay.show(tester.element(find.byType(AppLoadingLayout)));
      expect(find.byType(AppLoadingLayout), findsOneWidget);

      // reset
      LoadingOverlay.hide(tester.element(find.byType(AppLoadingLayout)));
    });

    testWidgets('hides overlay when requested', (tester) async {
      await tester.pumpWidget(testWidget);

      // Show overlay
      await tester.tap(find.text(showOverlayText));
      await tester.pump();
      expect(find.byType(AppLoadingLayout), findsOneWidget);

      // Hide overlay
      LoadingOverlay.hide(tester.element(find.byType(AppLoadingLayout)));
      await tester.pump();

      // Verify overlay is removed
      expect(find.byType(AppLoadingLayout), findsNothing);
    });

    testWidgets('does not crash when hiding non-existent overlay', (
      tester,
    ) async {
      await tester.pumpWidget(testWidget);

      // Hide when no overlay exists (should not throw)
      LoadingOverlay.hide(tester.element(find.text(showOverlayText)));
      await tester.pump();

      expect(find.text(showOverlayText), findsOneWidget);
    });
  });
}

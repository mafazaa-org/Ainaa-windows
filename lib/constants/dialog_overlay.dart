import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

///Global confirm overlay that is sit above all widget tree
///Show confirm overlay [DialogOverlay.show]
///Hide confirm overlay [DialogOverlay.hide]

final class DialogOverlay {
  static OverlayEntry? _overlayEntry;
  static final Logger _logger = Logger();

  static void show(
    BuildContext context, {
    required Widget child,
    bool barrierDismissible = false,
    Color? barrierColor,
  }) {
    try {
      if (_overlayEntry != null) {
        _logger.w('DialogOverlay already visible');
        return;
      }

      _overlayEntry = OverlayEntry(
        builder:
            (context) => _DialogOverlayContent(
              barrierColor:
                  barrierColor ?? Theme.of(context).shadowColor.withAlpha(120),
              dismissible: barrierDismissible,
              onDismiss: hide,
              child: child,
            ),
      );

      Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
      // _logger.d('DialogOverlay shown');
    } catch (e, stack) {
      _logger.e('Failed to show DialogOverlay', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Hides the currently visible overlay
  static void hide() {
    try {
      _overlayEntry?.remove();
      _overlayEntry = null;
      // _logger.d('DialogOverlay hidden');
    } catch (e, stack) {
      _logger.e('Failed to hide DialogOverlay', error: e, stackTrace: stack);
      rethrow;
    }
  }

  const DialogOverlay._();
}

class _DialogOverlayContent extends StatelessWidget {
  final Widget child;
  final Color barrierColor;
  final bool dismissible;
  final VoidCallback onDismiss;

  const _DialogOverlayContent({
    required this.child,
    required this.barrierColor,
    required this.dismissible,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: dismissible ? onDismiss : null,
            child: ColoredBox(color: barrierColor),
          ),
        ),
        Center(child: Material(type: MaterialType.transparency, child: child)),
      ],
    );
  }
}

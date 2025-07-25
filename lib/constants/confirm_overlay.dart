import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

///Global confirm overlay that is sit above all widget tree
///Show confirm overlay [ConfirmOverlay.show]
///Hide confirm overlay [ConfirmOverlay.hide]

final class ConfirmOverlay {
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
        _logger.w('ConfirmOverlay already visible');
        return;
      }

      _overlayEntry = OverlayEntry(
        builder:
            (context) => _ConfirmOverlayContent(
              barrierColor:
                  barrierColor ?? Theme.of(context).shadowColor.withAlpha(120),
              dismissible: barrierDismissible,
              onDismiss: hide,
              child: child,
            ),
      );

      Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
      // _logger.d('ConfirmOverlay shown');
    } catch (e, stack) {
      _logger.e('Failed to show ConfirmOverlay', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Hides the currently visible overlay
  static void hide() {
    try {
      _overlayEntry?.remove();
      _overlayEntry = null;
      // _logger.d('ConfirmOverlay hidden');
    } catch (e, stack) {
      _logger.e('Failed to hide ConfirmOverlay', error: e, stackTrace: stack);
      rethrow;
    }
  }

  const ConfirmOverlay._();
}

class _ConfirmOverlayContent extends StatelessWidget {
  final Widget child;
  final Color barrierColor;
  final bool dismissible;
  final VoidCallback onDismiss;

  const _ConfirmOverlayContent({
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

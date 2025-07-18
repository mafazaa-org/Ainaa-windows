import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:flutter/material.dart';

///Global confirm overlay that is sit above all widget tree
///Show confirm overlay [ConfirmOverlay.show]
///Hide confirm overlay [ConfirmOverlay.hide]

final class ConfirmOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context, Widget child) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Container(
            color: context.theme.shadowColor.withAlpha(120),
            alignment: Alignment.center,
            child: child,
          ),
    );

    // Insert the overlay into the overlay stack
    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hide(BuildContext context) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove(); // Remove the overlay from the stack
      _overlayEntry = null;
    }
  }

  const ConfirmOverlay._();
}

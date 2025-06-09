import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/core/shared_widgets/app_loading_layout.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

///Global loading overlay that is sit above all widget tree
///Show loading overlay [LoadingOverlay.show]
///Hide loading overlay [LoadingOverlay.hide]

final class LoadingOverlay {
  static OverlayEntry? _overlayEntry;
  static final Logger logger = Logger();

  static void show(BuildContext context) {
    logger.d('in show');
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Container(
            color: context.theme.shadowColor.withAlpha(120),
            alignment: Alignment.center,
            child: AppLoadingLayout(),
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

  const LoadingOverlay._();
}

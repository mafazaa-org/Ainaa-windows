import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/core/shared_widgets/app_loading_layout.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

///Global loading overlay that is sit above all widget tree
///Show loading overlay [LoadingOverlay.show]
///Hide loading overlay [LoadingOverlay.hide]

final class LoadingOverlay {
  static OverlayEntry? _overlayEntry;
  static final Logger _logger = Logger();

  static void show(BuildContext context) {
    try {
      if (_overlayEntry != null) {
        // _logger.d('Loading overlay already visible');
        return;
      }

      _overlayEntry = OverlayEntry(
        builder: (context) => _buildOverlayContent(context),
      );

      Overlay.of(context).insert(_overlayEntry!);
      // _logger.d('Loading overlay shown');
    } catch (e, stack) {
      _logger.e('Failed to show loading overlay', error: e, stackTrace: stack);
    }
  }

  static void hide() {
    try {
      if (_overlayEntry != null) {
        _overlayEntry!.remove();
        _overlayEntry = null;
        // _logger.d('Loading overlay hidden');
      }
    } catch (e, stack) {
      _logger.e('Failed to hide loading overlay', error: e, stackTrace: stack);
    }
  }

  static Widget _buildOverlayContent(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          color: context.theme.shadowColor.withAlpha(120),
          dismissible: false,
        ),
        Center(child: AppLoadingLayout()),
      ],
    );
  }

  const LoadingOverlay._();
}

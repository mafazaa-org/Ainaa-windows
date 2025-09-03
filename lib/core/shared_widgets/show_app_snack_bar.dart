import 'package:ainaa/config/extensions/context_extension.dart';
import 'package:ainaa/constants/app_spacing.dart';
import 'package:ainaa/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void showAppSnackbar(
  BuildContext context,
  String message, [
  int? durationInSeconds,
]) {
  _SnackBarOverlay.show(context, message: message);

  Future.delayed(Duration(seconds: durationInSeconds ?? 2), () {
    _SnackBarOverlay.hide();
  });
}

final class _SnackBarOverlay {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;
  static final Logger _logger = Logger();

  static void show(BuildContext context, {required String message}) {
    try {
      if (_overlayEntry != null) {
        _logger.w('SnackBarOverlay already visible');
        return;
      }
      _isVisible = true;

      _overlayEntry = OverlayEntry(
        builder:
            (context) => _SnacKBarOVerlayLayout(
              message: message,
              isVisible: _isVisible,
              onEnd: () {
                if (!_isVisible) {
                  _overlayEntry?.remove();
                  _overlayEntry = null;
                }
              },
            ),
      );

      Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
      // _logger.d('SnackBarOverlay shown');
    } catch (e, stack) {
      _logger.e('Failed to show SnackBarOverlay', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Hides the currently visible overlay
  static void hide() {
    try {
      if (_overlayEntry == null) return;
      _isVisible = false;
      _overlayEntry!.markNeedsBuild();
    } catch (e, stack) {
      _logger.e('Failed to hide SnackBarOverlay', error: e, stackTrace: stack);
      rethrow;
    }
  }

  const _SnackBarOverlay._();
}

class _SnacKBarOVerlayLayout extends StatelessWidget {
  const _SnacKBarOVerlayLayout({
    required this.message,
    required this.isVisible,
    required this.onEnd,
  });

  final String message;
  final bool isVisible;
  final void Function()? onEnd;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppSpacing.minHorizontal,
      right: AppSpacing.minHorizontal,
      width: context.screenWidth * .25,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 300),
        onEnd: onEnd,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
          child: Material(
            elevation: 8,
            borderRadius: AppStyles.borderRadiusM,
            color: context.theme.snackBarTheme.backgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sl,
              ),
              child: Text(message, style: context.textStyles.displayMedium),
            ),
          ),
        ),
      ),
    );
  }
}

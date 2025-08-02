import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/core/shared_widgets/app_confirm_button.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/constants/app_styles.dart';
import 'package:flutter/material.dart';

/// A widget that shows the layout in pop up window like [showDialog].
///
/// Contains a text and optional sub text,
/// with two action buttons when agreeing to the dialog [onPressed]
/// and when the dialog is not accepted [onCancelPressed]
///
/// {@tool snippet}
///
/// This example shows a dialog to confirm an action
///
/// ```dart
/// showDialog(
///   context: context,
///   builder:
///       (context) => Dialog(
///         child: AppDialogLayout(
///           text: "Are you Sure",
///           actionText: "Yes",
///           onPressed: () {
///             Navigator.canPop(context);
///             .... //an action
///           },
///           cancelText: "No",
///           onCancelPressed: () {
///              .... //an action
///              Navigator.maybePop(context),
///           }
///         ),
///       ),
/// );
/// ```
/// {@end-tool}
///

class AppDialogLayout extends StatelessWidget {
  final String text;
  final String? subText;
  final String actionText;
  final String? cancelText;
  final Widget? body;
  final void Function()? onPressed;
  final void Function()? onCancelPressed;

  /// Create a pop up layout.
  ///
  /// typically used with [showDialog] and [Dialog]

  const AppDialogLayout({
    super.key,
    required this.text,
    this.subText,
    required this.actionText,
    required this.onPressed,
    this.cancelText,
    this.onCancelPressed,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth * .6;
    return Container(
      width: width,
      constraints: BoxConstraints(maxWidth: 420.0),
      padding: EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: AppStyles.borderRadiusM,
      ),
      child: Column(
        spacing: AppSpacing.sm,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: context.textStyles.displayMedium),
          subText != null
              ? Text(subText!, style: context.textStyles.bodyMedium)
              : SizedBox.shrink(),
          body ?? SizedBox.shrink(),

          Row(
            spacing: AppSpacing.sl,
            children: [
              AppActionButton(onPressed: onPressed, actionText: actionText),
              Visibility(
                visible: cancelText != null,
                child: AppActionButton(
                  onPressed: onCancelPressed,
                  actionText: cancelText ?? '',
                  mainAction: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
